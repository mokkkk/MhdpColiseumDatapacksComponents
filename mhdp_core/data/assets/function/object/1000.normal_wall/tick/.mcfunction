#> assets:object/1000.normal_wall/tick/
#
# tick処理

# スコア増加
    scoreboard players add @s ObjectTick 1

# 演出・拡大
    execute if score @s ObjectTick matches 10 run function assets:object/1000.normal_wall/tick/expand

# 当たり判定有効化
    execute if score @s ObjectTick matches 13 run function assets:object/1000.normal_wall/tick/summon_hitbox

# 消去
    execute if score @s ObjectTick matches 200 run kill @n[type=shulker]
    execute if score @s ObjectTick matches 200 run kill @s
