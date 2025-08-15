#> assets:object/0006.jump_arrow/tick/move
#
# 矢の召喚処理
#
# @within function assets:object/0006.jump_arrow/tick/

# 移動
    tp @s ^ ^ ^0.8
    # particle cloud ~ ~ ~ 0 0 0 0.05 1 force
    particle sneeze ~ ~ ~ 0 0 0 0.05 2 force
    particle dust{color:[0.000,0.969,1.000],scale:2} ~ ~ ~ 0.1 0.1 0.1 0 1 force

# 障害物に当たった場合、上昇開始
    execute if entity @s[tag=!6.IsJump] unless block ^ ^ ^0.8 #mhdp_core:no_collision run particle flash ~ ~ ~ 0 0 0 0 1
    execute if entity @s[tag=!6.IsJump] unless block ^ ^ ^0.8 #mhdp_core:no_collision run playsound entity.breeze.jump master @a ~ ~ ~ 2 1
    execute if entity @s[tag=!6.IsJump] unless block ^ ^ ^0.8 #mhdp_core:no_collision run tag @s add 6.IsJump

# 攻撃
    execute if entity @s[tag=!6.IsHitNormal,tag=!6.IsJump] positioned ~-0.6 ~-0.6 ~-0.6 as @n[type=slime,tag=Mns.HitBox,dx=1,dy=1,dz=1] positioned ~0.3 ~0.3 ~0.3 if entity @s[dx=1,dy=1,dz=1] as @n[tag=This] at @s run function assets:object/0006.jump_arrow/tick/attack
    execute if entity @s[tag=6.IsJump,tag=!6.IsHitJump] positioned ~-0.6 ~-0.6 ~-0.6 as @n[type=slime,tag=Mns.HitBox,dx=1,dy=1,dz=1] positioned ~0.3 ~0.3 ~0.3 if entity @s[dx=1,dy=1,dz=1] as @n[tag=This] at @s run function assets:object/0006.jump_arrow/tick/attack
