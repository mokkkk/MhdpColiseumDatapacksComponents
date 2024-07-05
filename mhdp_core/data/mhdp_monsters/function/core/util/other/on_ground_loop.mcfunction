#> mhdp_monsters:core/util/other/on_ground_loop
# 
# 汎用処理 接地
#
# @within 
#         function mhdp_monsters:core/util/other/on_ground
#         function mhdp_monsters:core/util/other/on_ground_loop

# 接地するまで繰り返す
    execute if block ~ ~-1 ~ #mhdp_core:no_collision positioned ~ ~-1 ~ run function mhdp_monsters:core/util/other/on_ground_loop
    execute unless block ~ ~-1 ~ #mhdp_core:no_collision run tp @s ~ ~ ~
