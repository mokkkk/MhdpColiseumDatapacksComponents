#> assets:object/0001.normal_arrow/tick/
#
# 矢のtick処理
#
# @within function mhdp_items:/**

# スコア増加
    scoreboard players add @s ObjectTick 1

# teleport_duration設定
    execute if score @s ObjectTick matches 1 run data modify entity @s teleport_duration set value 1

# メイン処理実行
    execute if entity @s[tag=!1.Death] at @s run function assets:object/0001.normal_arrow/tick/move
    execute if entity @s[tag=!1.Death] at @s run function assets:object/0001.normal_arrow/tick/move

# 終了
    execute unless block ^ ^ ^ #mhdp_core:no_collision run kill @s
    execute if score @s ObjectTick matches 40.. run kill @s
