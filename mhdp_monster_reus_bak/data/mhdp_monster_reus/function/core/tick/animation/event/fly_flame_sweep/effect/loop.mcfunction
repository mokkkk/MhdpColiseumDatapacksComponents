#> mhdp_monster_reus:core/tick/animation/event/fly_flame_sweep/effect/loop
#
# アニメーションイベントハンドラ なぎはらい火炎放射
#
# @within function mhdp_monster_reus:core/tick/animation/event/tick

# 移動
    scoreboard players remove @s MhdpCore 1
    particle flame ~ ~ ~ 0.5 0.5 0.5 0.05 5 force
    execute if entity @a[tag=Ply.State.EnableDamage,tag=!Temp.Hit,distance=..2] run tag @a[tag=Ply.State.EnableDamage,tag=!Temp.Hit,distance=..2] add Temp.Hit
    execute if entity @e[type=slime,tag=Mns.HitBox,tag=!Mns.HitBox.DisableMnsDamage,tag=!Mns.HitBox.Reus,tag=!Temp.Hit,distance=..2] run tag @e[type=slime,tag=Mns.HitBox,tag=!Mns.HitBox.DisableMnsDamage,tag=!Mns.HitBox.Reus,tag=!Temp.Hit,distance=..2] add Temp.Hit
    execute if score @s MhdpCore matches 1.. unless block ^ ^ ^1 #mhdp_core:no_collision run scoreboard players set @s MhdpCore 0
    execute if score @s MhdpCore matches 1.. positioned ^ ^ ^1 run function mhdp_monster_reus:core/tick/animation/event/fly_flame_sweep/effect/loop
    execute unless block ^ ^ ^1.5 #mhdp_core:no_collision run tp @s ^ ^ ^1
