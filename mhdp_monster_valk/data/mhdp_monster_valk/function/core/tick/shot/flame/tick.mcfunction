#> mhdp_monster_dino:core/tick/shot/flame/tick
#
# ブレスtick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# タイマー増加
    scoreboard players add @s Mns.Shot.Timer 1

# 演出
    particle smoke ^ ^ ^-1 0.3 0 0.3 0.05 10
    particle flame ~ ~1 ~ 0.5 0.5 0.5 0.02 22
    particle flame ~ ~1 ~ 0.8 0.8 0.8 0.1 40
    particle lava ~ ~1 ~ 0.5 0.5 0.5 0 2

# 着弾
    execute if entity @a[tag=Ply.State.EnableDamage,distance=..2.5] at @s run function mhdp_monster_dino:core/tick/shot/flame/damage
    execute if entity @n[type=slime,tag=!Mns.HitBox.Dino,distance=..2.5] at @s run function mhdp_monster_dino:core/tick/shot/flame/damage

# 移動
    execute unless block ^ ^ ^2 #mhdp_core:no_collision run kill @s
    tp @s ^ ^ ^2

# 終了
    execute if score @s Mns.Shot.Timer matches 20.. run kill @s
