#> mhdp_monsters:core/util/tick/tick
# 
# 汎用処理 tickの共通処理
#
# @within function mhdp_monsters:/**

# 同士討ちの無敵時間
    # 適用
        execute if entity @s[tag=!Mns.State.IsDamageInterval] if score @s Mns.General.DamageInterval matches 1.. run function mhdp_monsters:core/util/tick/start_damage_interval
    # 終了
        execute if score @s Mns.General.DamageInterval matches 1.. run scoreboard players remove @s Mns.General.DamageInterval 1
        execute if entity @s[tag=Mns.State.IsDamageInterval] if score @s Mns.General.DamageInterval matches ..0 run function mhdp_monsters:core/util/tick/end_damage_interval

# 怒り
    execute if entity @s[tag=Mns.State.IsAnger] if score @s Mns.Anger.Timer matches 1.. run scoreboard players remove @s Mns.Anger.Timer 1
