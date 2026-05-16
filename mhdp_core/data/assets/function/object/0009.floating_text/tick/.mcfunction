#> assets:object/0009.floating_text/tick/
#
# 攻撃Vfxのtick処理
#
# @within function mhdp_items:/**

# タイマー増加
    scoreboard players add @s ObjectTick 1

# 透明化
    # execute if score @s ObjectTick matches 21..26 store result entity @s text_opacity int 1 run scoreboard players remove @s MhdpCore 40

# 終了
    execute if score @s ObjectTick matches 26.. run kill @s
