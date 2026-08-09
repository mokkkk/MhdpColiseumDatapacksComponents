#> assets:object/1001.normal_tower/tick/tick_remove
#
# tick処理

# 演出・拡大
    execute if score @s ObjectTick matches 1..15 run particle block{block_state:"minecraft:oak_planks"} ~ ~0.5 ~ 1 1 1 0 10
    execute if score @s ObjectTick matches 1 run function assets:object/1001.normal_tower/tick/contract

# 消去
    execute if score @s ObjectTick matches 15.. run function assets:object/1001.normal_tower/remove/
