#> mhdp_items:weapons/bow/type_tec/14_air_shot/move
#
# 空中射撃
#
# @within function mhdp_items:weapons/bow/type_tec/1_charge/change_to_chargeattack

# 初回のみ移動する
    execute if entity @s[tag=Ply.Ope.IsAir] run return 0
    tag @s add Ply.Ope.IsAir

# 移動
    tp @s @s
    execute rotated ~180 -45 run function api:weapon_operation/use_player_motion.m {Strength:4500, IsForce:true, IsAdjust:false}
