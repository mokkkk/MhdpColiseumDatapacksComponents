#> mhdp_items:weapons/bow/shot/shower/main
#
# 矢の処理
#
# @within function mhdp_items:/**

# 移動
    tp @s ^ ^ ^1
    execute if score @s Mns.Shot.Timer matches 7.. at @s run tp @s ^ ^ ^ ~ ~0.8
    particle crit ~ ~ ~ 0 0 0 0 1 force
    particle crit ~ ~ ~ 0.5 0.5 0.5 0 1 force

# 命中判定
    tag @s add Temp.This
    execute if entity @s[tag=!Death] at @s positioned ~-0.6 ~-0.6 ~-0.6 as @n[type=slime,tag=Mns.HitBox,dx=1,dy=1,dz=1] positioned ~0.3 ~0.3 ~0.3 if entity @s[dx=1,dy=1,dz=1] as @n[tag=Temp.This] at @s run function mhdp_items:weapons/bow/shot/shower/hit
    tag @s remove Temp.This
