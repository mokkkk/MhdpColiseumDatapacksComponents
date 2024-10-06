#> mhdp_monster_valk:core/tick/shot/breath/main
#
# ブレスtick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# 演出
    particle dust{color:[1.000,0.112,0.312],scale:2} ^ ^ ^ 0.4 0.4 0.4 0.15 3

# 着弾
    execute if entity @a[tag=Ply.State.EnableDamage,distance=..1.5] at @s run function mhdp_monster_valk:core/tick/shot/shot/damage
    execute if entity @n[type=slime,tag=!Mns.HitBox.Valk,distance=..1.5] at @s run function mhdp_monster_valk:core/tick/shot/shot/damage
    execute unless block ^ ^ ^1 #mhdp_core:no_collision run function mhdp_monster_valk:core/tick/shot/shot/damage

# 移動
    tp @s ^ ^ ^1
