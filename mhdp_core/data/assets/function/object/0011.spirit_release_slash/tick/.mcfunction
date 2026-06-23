#> assets:object/0011.spirit_release_slash/tick/
#
# 練気解放無双斬りのtick処理
#
# @within function mhdp_items:/**

# スコア増加
    scoreboard players add @s ObjectTick 1

# 演出
    execute if score @s ObjectTick matches 4 run function assets:object/0011.spirit_release_slash/tick/attack

# 攻撃
    execute if score @s ObjectTick matches 4 run function assets:object/0011.spirit_release_slash/tick/attack
    execute if score @s ObjectTick matches 5 run function assets:object/0011.spirit_release_slash/tick/attack
    execute if score @s ObjectTick matches 6 run function assets:object/0011.spirit_release_slash/tick/attack
    execute if score @s ObjectTick matches 7 run function assets:object/0011.spirit_release_slash/tick/attack
    execute if score @s ObjectTick matches 8 run function assets:object/0011.spirit_release_slash/tick/attack
    execute if score @s ObjectTick matches 9 run function assets:object/0011.spirit_release_slash/tick/attack
    execute if score @s ObjectTick matches 10 run function assets:object/0011.spirit_release_slash/tick/attack
    execute if score @s ObjectTick matches 11 run function assets:object/0011.spirit_release_slash/tick/attack
    execute if score @s ObjectTick matches 12 run function assets:object/0011.spirit_release_slash/tick/attack
    execute if score @s ObjectTick matches 13 run function assets:object/0011.spirit_release_slash/tick/attack
    execute if score @s ObjectTick matches 14 run function assets:object/0011.spirit_release_slash/tick/attack
    execute if score @s ObjectTick matches 15 run function assets:object/0011.spirit_release_slash/tick/attack
    execute if score @s ObjectTick matches 16 run function assets:object/0011.spirit_release_slash/tick/attack
    execute if score @s ObjectTick matches 17 run function assets:object/0011.spirit_release_slash/tick/attack
    execute if score @s ObjectTick matches 18 run function assets:object/0011.spirit_release_slash/tick/attack

# 終了
    execute if score @s ObjectTick matches 19.. run kill @s
