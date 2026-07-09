#> assets:object/10032.dino_breath/tick/wait
#
# オブジェクトのtick処理
#
# @within function mhdp_items:/**

# 演出
    execute if score @s ObjectTick matches ..15 run particle dust{color:[1.000,0.198,0.000],scale:1.5} ~ ~0.3 ~ 0.2 0.2 0.2 0 5
    execute if score @s ObjectTick matches ..15 run particle dust{color:[1.000,0.198,0.000],scale:1.5} ~ ~0.3 ~ 0.5 0.5 0.5 0 5
    execute if score @s ObjectTick matches 16.. run particle dust{color:[1.000,0.198,0.000],scale:3.5} ~ ~0.3 ~ 0.5 0.2 0.5 0 5
    execute if score @s ObjectTick matches 16.. run particle dust{color:[1.000,0.198,0.000],scale:3.5} ~ ~0.3 ~ 0.8 0.5 0.8 0 5
    particle lava ~ ~ ~ 0.5 0.5 0.5 0 1
    particle falling_lava ~ ~ ~ 0.5 0.5 0.5 0 10
    particle landing_lava ~ ~ ~ 0.7 0.5 0.7 0 10

# 攻撃
    execute if score @s ObjectTick matches 40.. at @s as @n[type=item_display,tag=Mns.Root.Dino] run function assets:object/10032.dino_breath/tick/attack
    execute if score @s ObjectTick matches 40.. run kill @s
