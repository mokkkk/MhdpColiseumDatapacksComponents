#> mhdp_monster_dino:core/damage/reaction/head
#
# 怯みリアクション 頭
#
# @within function mhdp_monster_dino:core/damage/damage

# 共通処理
    # スコアリセット
        scoreboard players operation @s Mns.Dino.Head.Damage = @s Mns.Dino.Head.Damage.Max
    # カウンター増加
        scoreboard players add @s Mns.Dino.Head.Damage.Count 1
        
# 部位破壊処理
    execute if entity @s[tag=!Mns.Break.Head] if score @s Mns.Dino.Head.Damage.Count matches 2.. run function mhdp_monster_dino:core/damage/reaction/head_break

# アニメーション再生処理
    # 麻痺・ダウン・スタン時以外
        execute unless entity @s[tag=!Mns.State.IsParalysis,tag=!Mns.State.IsDown,tag=!Mns.State.IsStun] run return 0
    # アニメーション再生
        execute if entity @s[tag=!Mns.State.IsFlying,tag=!Mns.Temp.IsDamaged] run function animated_java:dino_aj/animations/damage_head/tween {duration:1, to_frame: 0}
        execute if entity @s[tag=Mns.State.IsFlying,tag=!Mns.Temp.IsDamaged] run function mhdp_monster_dino:core/damage/reaction/flying
    # ダウン時間設定
        scoreboard players set @s Mns.General.DownCount 2
    # 攻撃者を向く
        execute at @s facing entity @a[tag=Temp.Attacker] feet run tp @s ~ ~ ~ ~ 0
    # 演出
        playsound entity.item.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
        playsound entity.item.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    # アニメーションタグ消去
        function mhdp_monsters:core/util/other/remove_animation_tag

# 終了
    tag @s add Mns.Temp.IsDamaged
