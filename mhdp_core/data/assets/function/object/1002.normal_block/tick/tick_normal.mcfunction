#> assets:object/1002.normal_block/tick/
#
# tick処理

# ダメージインターバル減少
    execute if score @s Build.Stats.DamageInterval matches 1.. run scoreboard players remove @s Build.Stats.DamageInterval 1

# 演出・拡大
    execute if score @s ObjectTick matches 1 run function assets:object/1002.normal_block/tick/expand

# 当たり判定有効化
    execute if score @s ObjectTick matches 3 run function assets:object/1002.normal_block/tick/summon_hitbox

# 消去
    execute if score @s ObjectTick >= @s Build.Stats.RemainingTime run function assets:object/1002.normal_block/is_broken/
