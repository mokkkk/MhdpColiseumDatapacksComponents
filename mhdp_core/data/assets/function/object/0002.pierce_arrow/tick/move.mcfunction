#> assets:object/0001.normal_arrow/tick/move
#
# 矢の召喚処理
#
# @within function assets:object/0001.normal_arrow/tick/

# 移動
    tp @s ^ ^ ^1
    particle firework ~ ~ ~ 0 0 0 0.05 1 force

# 攻撃
    execute unless entity @s[tag=2.Death] positioned ~-0.6 ~-0.6 ~-0.6 as @n[type=slime,tag=Mns.HitBox,dx=1,dy=1,dz=1] positioned ~0.3 ~0.3 ~0.3 if entity @s[dx=1,dy=1,dz=1] as @n[tag=This] at @s run function assets:object/0002.pierce_arrow/tick/attack
