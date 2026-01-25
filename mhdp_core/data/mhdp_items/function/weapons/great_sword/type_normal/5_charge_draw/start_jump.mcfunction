#> mhdp_items:weapons/great_sword/type_normal/5_charge_draw/start_jump
#
# 溜め 開始
#
# @within function mhdp_items:weapons/great_sword/type_normal/5_charge_draw/start

# 移動
    tp @s @s
    execute if entity @s[tag=Ply.Ope.IsSprinting] rotated ~ -50 run function api:weapon_operation/use_player_motion.m {Strength:8000, IsForce:false, IsAdjust:false}
    execute if entity @s[tag=!Ply.Ope.IsSprinting] rotated ~ -60 run function api:weapon_operation/use_player_motion.m {Strength:6000, IsForce:false, IsAdjust:false}

# 連続使用対策
    tag @s add Ply.Ope.IsAir
