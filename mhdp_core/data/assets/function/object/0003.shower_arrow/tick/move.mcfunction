#> assets:object/0003.shower_arrow/tick/move
#
# 矢の召喚処理
#
# @within function assets:object/0003.shower_arrow/tick/

# 移動
    tp @s ^ ^ ^1
    execute if score @s ObjectTick matches 7.. at @s run tp @s ^ ^ ^ ~ ~0.8
    particle crit ~ ~ ~ 0 0 0 0 1 force
    particle crit ~ ~ ~ 0.5 0.5 0.5 0 1 force

# 命中判定
    execute if entity @s[tag=!3.IsHit] at @s positioned ~-0.6 ~-0.6 ~-0.6 as @n[type=slime,tag=Mns.HitBox,dx=1,dy=1,dz=1] positioned ~0.3 ~0.3 ~0.3 if entity @s[dx=1,dy=1,dz=1] as @n[tag=This] at @s run function assets:object/0003.shower_arrow/tick/hit
