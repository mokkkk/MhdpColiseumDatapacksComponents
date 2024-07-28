#> mhdp_monsters:core/util/tick/get_state
# 
# 汎用処理 tickの共通処理
#
# @within function mhdp_monsters:/**

# 正面
    execute facing entity @n[tag=Mns.Temp.Target] feet rotated ~ 0 positioned ^ ^ ^1 rotated as @s positioned ^ ^ ^-1 if entity @s[distance=..0.25] run tag @s add Mns.Temp.Forward

# 背面
    execute facing entity @n[tag=Mns.Temp.Target] feet rotated ~ 0 positioned ^ ^ ^-1 rotated as @s positioned ^ ^ ^-1 if entity @s[distance=..0.25] run tag @s add Mns.Temp.Back
