#> mhdp_monster_reus:core/damage/reaction/leg_r
#
# 怯みリアクション 右足
#
# @within function mhdp_monster_reus:core/damage/damage

# 共通処理
    # スコアリセット
        scoreboard players operation @s Mns.Reus.LegR.Damage = @s Mns.Reus.LegR.Damage.Max
    # カウンター増加
        scoreboard players add @s Mns.Reus.Leg.Damage.Count 1

# アニメーション再生処理
    # 麻痺・ダウン・スタン時以外
        execute unless entity @s[tag=!Mns.State.IsParalysis,tag=!Mns.State.IsDown,tag=!Mns.State.IsStun] run return 0
    # アニメーション再生
            execute if score @s Mns.Reus.Leg.Damage.Count matches ..1 run function animated_java:reus_aj/animations/land_damage_l/tween {duration:1, to_frame: 0}
            execute if score @s Mns.Reus.Leg.Damage.Count matches 2.. run function animated_java:reus_aj/animations/land_damage_down_l/tween {duration:1, to_frame: 0}
            execute if entity @s[tag=Mns.State.IsFlying,tag=!Mns.Temp.IsDamaged] run function mhdp_monster_reus:core/damage/reaction/flying
    # ダウン時間設定
        scoreboard players set @s Mns.General.DownCount 5
    # 演出
        playsound entity.item.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
        playsound entity.item.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5

# 終了
    execute if score @s Mns.Reus.Leg.Damage.Count matches 2.. run scoreboard players set @s Mns.Reus.Leg.Damage.Count 0
