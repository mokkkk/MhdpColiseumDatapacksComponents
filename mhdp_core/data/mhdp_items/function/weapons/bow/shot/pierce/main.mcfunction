#> mhdp_items:weapons/bow/shot/pierce/main
#
# 矢の処理
#
# @within function mhdp_items:/**

# 移動
    tp @s ^ ^ ^1
    particle firework ~ ~ ~ 0 0 0 0.05 1 force

# 攻撃
    tag @s add Temp.This
    execute if entity @s[tag=Wpn.Bw.Type.Normal,tag=!Death] unless score @s Wpn.GeneralTimer matches 1.. at @s positioned ~-0.6 ~-0.6 ~-0.6 as @n[type=slime,tag=Mns.HitBox,dx=1,dy=1,dz=1] positioned ~0.3 ~0.3 ~0.3 if entity @s[dx=1,dy=1,dz=1] as @n[tag=Temp.This] at @s run function mhdp_items:weapons/bow/shot/pierce/attack_n
    execute if entity @s[tag=!Wpn.Bw.Type.Normal,tag=!Death] unless score @s Wpn.GeneralTimer matches 1.. at @s positioned ~-0.6 ~-0.6 ~-0.6 as @n[type=slime,tag=Mns.HitBox,dx=1,dy=1,dz=1] positioned ~0.3 ~0.3 ~0.3 if entity @s[dx=1,dy=1,dz=1] as @n[tag=Temp.This] at @s run function mhdp_items:weapons/bow/shot/pierce/attack
    tag @s remove Temp.This
