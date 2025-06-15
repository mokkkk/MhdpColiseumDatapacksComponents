#> mhdp_items:weapons/bow/shot/apply_bottle_effect
#
# 矢の処理
#
# @within function mhdp_items:/**

# タグ付与
    execute if score @s Wpn.Bw.Bottle.Type matches 0 run data modify storage api: Arg.Override.Bin set value "Strong"
