#> assets:object/0012.iai_spirit_slash/tick/
#
# オブジェクトのtick処理
#
# @within function mhdp_items:/**

# スコア増加
    scoreboard players add @s ObjectTick 1

# 攻撃
    execute if score @s ObjectTick matches 16 run function assets:object/0012.iai_spirit_slash/tick/attack

# 終了
    execute if score @s ObjectTick matches 16.. run kill @s
