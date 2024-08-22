#> mhdp_monsters:core/effect/tick
#
# 汎用処理 演出
#
# @within function mhdp_monsters:/**

# タイマー
    scoreboard players add @s MhdpCore 1
    
# 演出
    execute if score @s MhdpCore matches 1 run data modify entity @s teleport_duration set value 2
    execute if score @s MhdpCore matches 1..4 run tp @s ~ ~0.3 ~
    execute if score @s MhdpCore matches 21..40 run tp @s ~ ~-0.05 ~

# 終了
    execute if score @s MhdpCore matches 60.. run kill @s
