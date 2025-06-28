#> assets:object/0005.targetting_arrow/tick/move
#
# 矢の召喚処理
#
# @within function assets:object/0005.targetting_arrow/tick/

# 移動
    execute at @s run tp @s ^ ^ ^1
    particle crit ~ ~ ~ 0 0 0 0 1 force

# 攻撃
    execute if entity @s[tag=!5.Death] at @s positioned ~-0.6 ~-0.6 ~-0.6 as @n[type=slime,tag=Mns.HitBox,dx=1,dy=1,dz=1] positioned ~0.3 ~0.3 ~0.3 if entity @s[dx=1,dy=1,dz=1] as @n[tag=This] at @s run function assets:object/0005.targetting_arrow/tick/attack
