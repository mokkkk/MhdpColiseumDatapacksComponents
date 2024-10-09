#> mhdp_items:weapons/bow/shot/normal/attack_bottle_strong
#
# 矢の処理
#
# @within function mhdp_items:weapons/bow/shot/normal/attack

# モーション値上昇
    execute store result score #mhdp_temp_attack_value_strong MhdpCore run data get storage mhdp_core:temp Damage.DamageMult 100
    scoreboard players operation #mhdp_temp_attack_value_strong MhdpCore *= #const_bow_bottle_strong_multiply Const
    execute store result storage mhdp_core:temp Damage.DamageMult int 0.01 run scoreboard players operation #mhdp_temp_attack_value_strong MhdpCore /= #const_100 Const

# 終了
    scoreboard players reset #mhdp_temp_attack_value_strong MhdpCore
