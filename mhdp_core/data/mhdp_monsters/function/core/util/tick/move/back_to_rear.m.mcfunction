#> mhdp_monsters:core/util/tick/move/back_to_rear.m
# 
# 汎用処理 背後方向に移動する
#
# @within function mhdp_monsters:core/util/tick/tick

# 埋まらない位置まで平行移動
    execute rotated ~ 0 positioned as @s run function mhdp_monsters:core/util/tick/move/move_loop_object
    scoreboard players reset #mhdp_back_count MhdpCore
