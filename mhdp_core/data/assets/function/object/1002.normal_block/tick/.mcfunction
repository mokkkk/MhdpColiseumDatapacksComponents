#> assets:object/1002.normal_block/tick/
#
# tick処理

# スコア増加
    scoreboard players add @s ObjectTick 1

# 演出・拡大
    execute if score @s ObjectTick matches 1 run function assets:object/1002.normal_block/tick/expand

# 当たり判定有効化
    execute if score @s ObjectTick matches 3 run function assets:object/1002.normal_block/tick/summon_hitbox

# 消去
    execute if score @s ObjectTick matches 100.. run function assets:object/1002.normal_block/remove/
