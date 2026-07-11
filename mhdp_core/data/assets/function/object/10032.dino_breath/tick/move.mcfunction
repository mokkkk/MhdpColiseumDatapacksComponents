#> assets:object/10032.dino_breath/tick/move
#
# オブジェクトのtick処理
#
# @within function mhdp_items:/**

# 演出
    particle dust{color:[1.000,0.198,0.000],scale:1.5} ~ ~ ~ 0.2 0.2 0.2 0 5
    particle dust{color:[1.000,0.198,0.000],scale:1.5} ~ ~ ~ 0.5 0.5 0.5 0 5
    particle flame ~ ~ ~ 0.3 0.3 0.3 0.02 10

# オブジェクトヒット確認
    execute if entity @s[tag=!10032.IsAttacked] if entity @n[type=shulker,tag=Asset.Build.HitBox,dx=0.1,dy=0.1,dz=0.1] run function assets:object/10032.dino_breath/tick/hit

# 移動
    execute if entity @s[tag=!10032.OnGround] unless block ^ ^ ^1 #mhdp_core:no_collision run scoreboard players set @s Mns.Shot.Timer 0
    execute unless block ^ ^ ^1 #mhdp_core:no_collision run tag @s add 10032.OnGround
    execute if entity @s[tag=!10032.OnGround] run tp @s ^ ^ ^1
