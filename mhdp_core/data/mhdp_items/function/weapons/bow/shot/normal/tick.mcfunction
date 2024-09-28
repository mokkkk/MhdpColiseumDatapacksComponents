#> mhdp_items:weapons/bow/shot/normal/tick
#
# 矢の処理
#
# @within function mhdp_items:/**

# タイマー増加
    scoreboard players add @s Mns.Shot.Timer 1
    execute at @s run tp @s ^ ^ ^2.5
    execute if score @s Mns.Shot.Timer matches 8.. at @s run tp @s ^ ^ ^ ~ ~0.8
    particle crit ~ ~ ~ 0 0 0 0 1 force

# teleport_duration設定
    execute if score @s Mns.Shot.Timer matches 1 run data modify entity @s teleport_duration set value 1

# 攻撃
    execute at @s positioned ~-0.5 ~-0.5 ~-0.5 if entity @n[type=slime,tag=Mns.HitBox,dx=1,dy=1,dz=1] run function mhdp_items:weapons/bow/shot/normal/attack

# 終了
    execute if entity @s[tag=!Death] unless block ^ ^ ^2.5 #mhdp_core:no_collision run kill @s
    execute if entity @s[tag=!Death] if score @s Mns.Shot.Timer matches 30.. run kill @s
