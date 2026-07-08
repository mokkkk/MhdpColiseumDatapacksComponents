#> assets:object/10032.dino_breath/tick/
#
# オブジェクトのtick処理
#
# @within function mhdp_items:/**

# スコア増加
    scoreboard players add @s ObjectTick 1

# 演出
    particle smoke ^ ^ ^-1 0.3 0 0.3 0.05 10
    particle flame ~ ~1 ~ 0.5 0.5 0.5 0.02 22
    particle flame ~ ~1 ~ 0.8 0.8 0.8 0.1 40
    particle lava ~ ~1 ~ 0.5 0.5 0.5 0 2

# 着弾
    execute at @s as @n[type=item_display,tag=Mns.Root.Dino] run function assets:object/10032.dino_breath/tick/attack

# 移動
    execute unless block ^ ^ ^2 #mhdp_core:no_collision run kill @s
    tp @s ^ ^ ^2

# 終了
    execute if score @s ObjectTick matches 20.. run kill @s
