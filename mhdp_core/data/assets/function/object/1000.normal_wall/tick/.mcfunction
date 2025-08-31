#> assets:object/1000.normal_wall/tick/
#
# tick処理

# スコア増加
    scoreboard players add @s ObjectTick 1

# 演出・拡大
    execute if score @s ObjectTick matches 1..10 run particle block{block_state:"minecraft:oak_planks"} ~ ~0.5 ~ 1 0 1 0 10
    execute if score @s ObjectTick matches 10 run function assets:object/1000.normal_wall/tick/expand

# 当たり判定有効化
    execute if score @s ObjectTick matches 13 run function assets:object/1000.normal_wall/tick/summon_hitbox

# 消去
    execute if score @s ObjectTick matches 200.. run function assets:object/1000.normal_wall/remove/
