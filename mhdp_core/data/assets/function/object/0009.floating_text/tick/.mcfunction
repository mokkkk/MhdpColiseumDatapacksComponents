#> assets:object/0009.floating_text/tick/
#
# 攻撃Vfxのtick処理
#
# @within function mhdp_items:/**

# タイマー増加
    scoreboard players add @s ObjectTick 1

# 移動
    # execute if score @s ObjectTick matches 1 run tp @s ~ ~0.5 ~

# 終了
    execute if score @s ObjectTick matches 40.. run kill @s
