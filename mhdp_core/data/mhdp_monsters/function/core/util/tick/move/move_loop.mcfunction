#> mhdp_monsters:core/util/tick/move/move_loop
# 
# 汎用処理 ブロックのない位置まで移動
#
# @within function mhdp_monsters:core/util/tick/tick

# 平行移動処理
    execute unless score #mhdp_back_count MhdpCore matches 10.. unless block ^ ^ ^ #mhdp_core:no_collision positioned ^ ^ ^0.5 run function mhdp_monsters:core/util/tick/move/move_loop
    execute if block ^ ^ ^ #mhdp_core:no_collision run tp @s ~ ~ ~
    scoreboard players add #mhdp_back_count MhdpCore 1
