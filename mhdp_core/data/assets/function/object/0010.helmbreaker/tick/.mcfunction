#> assets:object/0010.helmbreaker/tick/
#
# 兜割のtick処理
#
# @within function mhdp_items:/**

# スコア増加
    scoreboard players add @s ObjectTick 1

# 攻撃
    execute if score @s ObjectTick matches 13 run function assets:object/0010.helmbreaker/tick/attack
    execute if score @s ObjectTick matches 15 run function assets:object/0010.helmbreaker/tick/attack
    execute if score @s ObjectTick matches 17 run function assets:object/0010.helmbreaker/tick/attack
    execute if score @s ObjectTick matches 19 run function assets:object/0010.helmbreaker/tick/attack
    execute if score @s ObjectTick matches 21 run function assets:object/0010.helmbreaker/tick/attack
    execute if score @s ObjectTick matches 23 run function assets:object/0010.helmbreaker/tick/attack
    execute if score @s ObjectTick matches 25 run function assets:object/0010.helmbreaker/tick/attack

# 終了
    execute if score @s ObjectTick matches 25.. run kill @s
