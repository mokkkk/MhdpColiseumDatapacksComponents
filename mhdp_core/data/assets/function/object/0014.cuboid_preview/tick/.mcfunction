#> assets:object/0014.cuboid_preview/tick/
#
# オブジェクトのtick処理
#
# @within function mhdp_items:/**

# スコア増加
    scoreboard players add @s ObjectTick 1

# 終了
    execute if score @s ObjectTick matches 30.. run kill @s
