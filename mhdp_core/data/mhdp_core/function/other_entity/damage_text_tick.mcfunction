#> mhdp_core:other_entity/damage_text_tick
#
# 毎tick実行される処理 ダメージ表示
#
# @within function minecraft:tick

# タイマー増加
    scoreboard players add @s MhdpCore 1

# 移動
    execute if score @s MhdpCore matches 1 run tp @s ~ ~2 ~
    execute if score @s MhdpCore matches 11 run tp @s ~ ~0.5 ~
    execute if score @s MhdpCore matches 21 run tp @s ~ ~0.2 ~

# 終了
    execute if score @s MhdpCore matches 30.. run kill @s
