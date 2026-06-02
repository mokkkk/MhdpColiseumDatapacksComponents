#> mhdp_monsters:core/util/tick/move/move_loop_object
# 
# 汎用処理 ブロックのない位置まで移動
#
# @within function mhdp_monsters:core/util/tick/tick

# 平行移動処理
    execute unless score #mhdp_back_count MhdpCore matches 10.. if entity @n[type=shulker,dx=0.1,dy=0.1,dz=0.1] positioned ^ ^ ^-0.5 run function mhdp_monsters:core/util/tick/move/move_loop_object
    execute unless entity @n[type=shulker,dx=0.1,dy=0.1,dz=0.1] run tp @s ~ ~ ~
    scoreboard players add #mhdp_back_count MhdpCore 1
