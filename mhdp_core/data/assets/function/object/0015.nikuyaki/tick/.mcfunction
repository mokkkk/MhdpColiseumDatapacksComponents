#> assets:object/0015.nikuyaki/tick/
#
# オブジェクトのtick処理
#
# @within function mhdp_items:/**

# スコア増加
    scoreboard players add @s ObjectTick 1

# モデル処理
    execute on passengers run function assets:object/0015.nikuyaki/tick/on_model

# 削除
    execute if score @s ObjectTick matches 10.. run function assets:object/0015.nikuyaki/tick/remove
    execute if entity @s[tag=15.IsRemove] run function assets:object/0015.nikuyaki/tick/remove
