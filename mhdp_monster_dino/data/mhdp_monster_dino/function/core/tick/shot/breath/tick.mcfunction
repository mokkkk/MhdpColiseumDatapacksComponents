#> mhdp_monster_reus:core/tick/shot/breath/tick
#
# ブレスtick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# タイマー増加
    scoreboard players add @s Mns.Shot.Timer 1

# 演出
    particle flame ~ ~ ~ 0.5 0.5 0.5 0.1 5
    particle flame ~ ~ ~ 0.2 0.2 0.2 0.02 10

# 着弾
    execute if entity @a[tag=Ply.State.EnableDamage,distance=..2.6] at @s run function mhdp_monster_reus:core/tick/shot/breath/damage
    execute if entity @n[type=slime,tag=!Mns.HitBox.Reus,distance=..2.6] at @s run function mhdp_monster_reus:core/tick/shot/breath/damage

# 移動
    execute unless block ^ ^ ^1 #mhdp_core:no_collision run function mhdp_monster_reus:core/tick/shot/breath/damage
    tp @s ^ ^ ^1

# 終了
    execute if score @s Mns.Shot.Timer matches 30.. run function mhdp_monster_reus:core/tick/shot/breath/damage
