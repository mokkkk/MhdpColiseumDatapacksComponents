#> mhdp_items:weapons/great_sword/type_normal/5_charge_draw/start_jump
#
# 溜め 開始
#
# @within function mhdp_items:weapons/great_sword/type_normal/5_charge_draw/start

# 移動
    tp @s @s
    scoreboard players set $strength delta.api.launch 6000
    execute rotated ~ -60 run function delta:api/launch_looking
