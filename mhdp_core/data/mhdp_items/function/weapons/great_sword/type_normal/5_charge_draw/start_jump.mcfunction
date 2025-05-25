#> mhdp_items:weapons/great_sword/type_normal/5_charge_draw/start_jump
#
# 溜め 開始
#
# @within function mhdp_items:weapons/great_sword/type_normal/5_charge_draw/start

# 移動
    tp @s @s
    execute if entity @s[tag=Ply.Ope.IsSprinting] run scoreboard players set $strength player_motion.api.launch 8000
    execute if entity @s[tag=!Ply.Ope.IsSprinting] run scoreboard players set $strength player_motion.api.launch 6000
    execute if entity @s[tag=Ply.Ope.IsSprinting] rotated ~ -50 run function player_motion:api/launch_looking
    execute if entity @s[tag=!Ply.Ope.IsSprinting] rotated ~ -60 run function player_motion:api/launch_looking

# 連続使用対策
    tag @s add Ply.Ope.IsAir
