#> mhdp_monster_valk:core/damage/reaction/leg_r
#
# 怯みリアクション 右足
#
# @within function mhdp_monster_valk:core/damage/damage

# 共通処理
    # スコアリセット
        scoreboard players operation @s Mns.Valk.LegL.Damage = @s Mns.Valk.LegL.Damage.Max
    # カウンター増加
        scoreboard players add @s Mns.Valk.LegL.Damage.Count 1

# アニメーション再生処理
    # 麻痺・ダウン・スタン時以外
        execute unless entity @s[tag=!Mns.State.IsParalysis,tag=!Mns.State.IsDown,tag=!Mns.State.IsStun] run return 0
    # アニメーション再生
            execute if score @s Mns.Valk.LegL.Damage.Count matches ..2 run function animated_java:valk_aj/animations/lance_damage_body_l/tween {duration:1, to_frame: 0}
            execute if score @s Mns.Valk.LegL.Damage.Count matches 3.. run function animated_java:valk_aj/animations/lance_damage_down_l/tween {duration:1, to_frame: 0}
            execute if entity @s[tag=Mns.State.IsFlying,tag=!Mns.Temp.IsDamaged] run function mhdp_monster_valk:core/damage/reaction/flying
    # ダウン時間設定
        scoreboard players set @s Mns.General.DownCount 2
        execute if score @s Mns.Valk.LegL.Damage.Count matches 3.. run scoreboard players set @s Mns.General.DownCount 5
    # 演出
        playsound entity.item.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
        playsound entity.item.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    # アニメーションタグ消去
        function mhdp_monsters:core/util/other/remove_animation_tag
    # 状態設定
        execute if score @s Mns.Valk.ArmR.Damage.Count matches 3.. run tag @s add Mns.State.IsDown
        tag @s remove Mns.State.IsDisableAngerSpeed
    # モデル変更
        function mhdp_monster_valk:core/util/models/model_interrupt

# 終了
    execute if score @s Mns.Valk.LegL.Damage.Count matches 3.. run scoreboard players set @s Mns.Valk.LegL.Damage.Count 0
