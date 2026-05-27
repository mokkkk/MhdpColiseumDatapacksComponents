#> assets:object/0013.sakura_slash/tick/
#
# オブジェクトのtick処理
#
# @within function mhdp_items:/**

# スコア増加
    scoreboard players add @s ObjectTick 1

# 攻撃
    execute if score @s ObjectTick matches 19 run function assets:object/0013.sakura_slash/tick/attack.m {Type:"1"}
    execute if score @s ObjectTick matches 22 run function assets:object/0013.sakura_slash/tick/attack.m {Type:"2"}
    execute if score @s ObjectTick matches 25 run function assets:object/0013.sakura_slash/tick/attack.m {Type:"2"}

# 終了
    execute if score @s ObjectTick matches 25.. run kill @s
