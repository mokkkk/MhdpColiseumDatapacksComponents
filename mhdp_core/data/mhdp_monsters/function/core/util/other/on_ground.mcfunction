#> mhdp_monsters:core/util/other/on_ground
# 
# 汎用処理 接地
#
# @within function mhdp_monsters:/**

# 接地
    summon marker ~ ~ ~ {Tags:["GroundPos"]}
    execute as @n[type=marker,tag=GroundPos] at @s align y run tp @s ~ ~ ~
    execute as @n[type=marker,tag=GroundPos] at @s run function mhdp_monsters:core/util/other/on_ground_loop
    execute positioned as @n[type=marker,tag=GroundPos] align y run tp @s ~ ~-0.4 ~
    kill @e[type=marker,tag=GroundPos]
