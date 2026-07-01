#> assets:object/0016.ground_crack/tick/
#
# オブジェクトのtick処理
#
# @within function mhdp_items:/**

# スコア増加
    scoreboard players add @s ObjectTick 1

# 演出
    execute if score @s ObjectTick matches 1 run data modify entity @s teleport_duration set value 2
    execute if score @s ObjectTick matches 1..4 run tp @s ~ ~0.4 ~
    execute if score @s ObjectTick matches 21..59 run tp @s ~ ~-0.05 ~

# 削除
    execute if score @s ObjectTick matches 60.. run function assets:object/0016.ground_crack/tick/remove
