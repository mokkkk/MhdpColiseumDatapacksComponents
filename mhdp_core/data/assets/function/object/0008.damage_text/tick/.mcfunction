#> assets:object/0007.attack_vfx/tick/
#
# 攻撃Vfxのtick処理
#
# @within function mhdp_items:/**

# タイマー増加
    scoreboard players add @s ObjectTick 1

# 移動
    execute if score @s ObjectTick matches 1 run tp @s ~ ~1.6 ~
    execute if score @s ObjectTick matches 11 run tp @s ~ ~0.3 ~
    execute if score @s ObjectTick matches 21 run tp @s ~ ~0.1 ~

# 終了
    execute if score @s ObjectTick matches 30.. run kill @s
