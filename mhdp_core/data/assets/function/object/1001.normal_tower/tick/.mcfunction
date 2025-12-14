#> assets:object/1001.normal_tower/tick/
#
# tick処理

# スコア増加
    scoreboard players add @s ObjectTick 1

# 演出・拡大
    execute if score @s ObjectTick matches 1..10 run particle block{block_state:"minecraft:oak_planks"} ~ ~0.5 ~ 1 0 1 0 10
    execute if score @s ObjectTick matches 10 run function assets:object/1001.normal_tower/tick/expand

# 当たり判定有効化
    execute if score @s ObjectTick matches 15 run function assets:object/1001.normal_tower/tick/summon_hitbox

# 消去
    execute if score @s ObjectTick matches 600.. run function assets:object/1001.normal_tower/remove/
