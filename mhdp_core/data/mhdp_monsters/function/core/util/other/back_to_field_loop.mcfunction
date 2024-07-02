#> mhdp_monsters:core/util/other/back_to_field_loop
#
# 汎用処理 フィールドまで戻る
#
# @within function mhdp_monsters:/**

# 位置をフィールド内まで移動
    execute unless score #mhdp_back_count MhdpCore matches 10.. unless block ^ ^ ^0.5 #mhdp_core:no_collision unless block ^ ^1 ^0.5 #mhdp_core:no_collision unless block ^ ^2 ^0.5 #mhdp_core:no_collision unless block ^ ^3 ^0.5 #mhdp_core:no_collision positioned ^ ^ ^0.5 run function mhdp_monsters:core/util/other/back_to_field_loop
    execute if block ^ ^ ^0.5 #mhdp_core:no_collision run tp @s ~ ~ ~
    scoreboard players add #mhdp_back_count MhdpCore 1
