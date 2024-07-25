#> mhdp_monster_reus:core/damage/reaction/tail
#
# 怯みリアクション 頭
#
# @within function mhdp_monster_reus:core/damage/damage

# 部位破壊処理
    # execute if entity @s[tag=!Mns.Break.Tail] run function mhdp_monster_reus:core/damage/reaction/tail_break

# 共通処理
    # スコアリセット
        scoreboard players operation @s Mns.Reus.Tail.Damage = @s Mns.Reus.Tail.Damage.Max

# アニメーション再生処理
    # 麻痺・ダウン・スタン時以外
        execute unless entity @s[tag=!Mns.State.IsParalysis,tag=!Mns.State.IsDown,tag=!Mns.State.IsStun] run return 0
    # アニメーション再生
        execute if entity @s[tag=!Mns.State.IsFlying,tag=!Mns.Temp.IsDamaged,tag=!Mns.Break.Tail] run function animated_java:reus_aj/animations/land_damage_tail/tween {duration:1, to_frame: 0}
        execute if entity @s[tag=!Mns.State.IsFlying,tag=!Mns.Temp.IsDamaged,tag=Mns.Break.Tail] run function animated_java:reus_aj/animations/land_damage_back/tween {duration:1, to_frame: 0}
        execute if entity @s[tag=Mns.State.IsFlying,tag=!Mns.Temp.IsDamaged] run function mhdp_monsters:core/util/damage/reaction_flying
    # ダウン時間設定
        scoreboard players set @s Mns.General.DownCount 0
    # 演出
        playsound entity.item.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
        playsound entity.item.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
        playsound entity.item.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
