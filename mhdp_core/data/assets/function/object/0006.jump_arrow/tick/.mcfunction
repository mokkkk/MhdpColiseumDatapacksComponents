#> assets:object/0006.jump_arrow/tick/
#
# 矢のtick処理
#
# @within function mhdp_items:/**

# スコア増加
    scoreboard players add @s ObjectTick 1

# teleport_duration設定
    execute if score @s ObjectTick matches 1 run data modify entity @s teleport_duration set value 1

# メイン処理実行
    execute if entity @s[tag=!6.IsJump] if score @s ObjectTick matches 8.. run particle flash ~ ~ ~ 0 0 0 0 1
    execute if entity @s[tag=!6.IsJump] if score @s ObjectTick matches 8.. run tag @s add 6.IsJump
    execute if entity @s[tag=6.IsJump] run tp @s ~ ~ ~ ~ -90
    execute at @s run function assets:object/0006.jump_arrow/tick/move
    execute at @s run function assets:object/0006.jump_arrow/tick/move
    execute at @s run function assets:object/0006.jump_arrow/tick/move
    execute at @s run function assets:object/0006.jump_arrow/tick/move
    execute if entity @s[tag=6.IsJump] at @s run function assets:object/0006.jump_arrow/tick/move
    execute if entity @s[tag=6.IsJump] at @s run function assets:object/0006.jump_arrow/tick/move
    execute at @s run function assets:object/0006.jump_arrow/tick/particle

# 終了
    execute if score @s ObjectTick matches 14.. run kill @s
