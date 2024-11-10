#> mhdp_monster_dino:core/damage/reaction/leg_r
#
# 怯みリアクション 右足
#
# @within function mhdp_monster_dino:core/damage/damage

# 共通処理
    # スコアリセット
        scoreboard players operation @s Mns.Dino.LegR.Damage = @s Mns.Dino.LegR.Damage.Max
    # カウンター増加
        scoreboard players add @s Mns.Dino.LegR.Damage.Count 1

# 部位破壊処理
    execute if entity @s[tag=!Mns.Break.Leg.R] if score @s Mns.Dino.LegR.Damage.Count matches 2.. run function mhdp_monster_dino:core/damage/reaction/leg_r_break

# アニメーション再生処理
    # 麻痺・ダウン・スタン時以外
        execute unless entity @s[tag=!Mns.State.IsParalysis,tag=!Mns.State.IsDown,tag=!Mns.State.IsStun] run return 0
    # アニメーション再生
            execute if score @s Mns.Dino.LegR.Damage.Count matches ..1 run function animated_java:dino_aj/animations/damage_left/tween {duration:1, to_frame: 0}
            execute if score @s Mns.Dino.LegR.Damage.Count matches 2.. run function animated_java:dino_aj/animations/damage_down_left/tween {duration:1, to_frame: 0}
            execute if entity @s[tag=Mns.State.IsFlying,tag=!Mns.Temp.IsDamaged] run function mhdp_monster_dino:core/damage/reaction/flying
    # ダウン時間設定
        scoreboard players set @s Mns.General.DownCount 5
    # 演出
        playsound entity.item.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
        playsound entity.item.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    # アニメーションタグ消去
        function mhdp_monsters:core/util/other/remove_animation_tag
    # 状態設定
        execute if score @s Mns.Dino.LegR.Damage.Count matches 2.. run tag @s add Mns.State.IsDown

# 終了
    execute if score @s Mns.Dino.LegR.Damage.Count matches 2.. run scoreboard players set @s Mns.Dino.LegR.Damage.Count 0
    tag @s add Mns.Temp.IsDamaged
