#> mhdp_monster_dino:core/tick/shot/breath/main
#
# ブレスtick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# 演出
    execute if score @s Mns.Shot.Timer matches ..10 run particle dust{color:[1.000,0.198,0.000],scale:1.5} ~ ~ ~ 0.2 0.2 0.2 0 5
    execute if score @s Mns.Shot.Timer matches ..10 run particle dust{color:[1.000,0.198,0.000],scale:1.5} ~ ~ ~ 0.5 0.5 0.5 0 5
    execute if entity @s[tag=!Mns.Shot.Dino.Breath.Land] run particle flame ~ ~ ~ 0.3 0.3 0.3 0.02 10
    execute if entity @s[tag=Mns.Shot.Dino.Breath.Land] run particle lava ~ ~ ~ 0.5 0.5 0.5 0 1
    execute if entity @s[tag=Mns.Shot.Dino.Breath.Land] run particle falling_lava ~ ~ ~ 0.5 0.5 0.5 0 10
    execute if entity @s[tag=Mns.Shot.Dino.Breath.Land] run particle landing_lava ~ ~ ~ 0.7 0.5 0.7 0 10

# 着弾
    execute if entity @s[tag=!Mns.Shot.Dino.Breath.Land] if entity @a[tag=Ply.State.EnableDamage,distance=..1.5] at @s run function mhdp_monster_dino:core/tick/shot/breath/damage
    execute if entity @s[tag=!Mns.Shot.Dino.Breath.Land] if entity @n[type=slime,tag=!Mns.HitBox.Dino,distance=..1.5] at @s run function mhdp_monster_dino:core/tick/shot/breath/damage

# 移動
    execute if entity @s[tag=!Mns.Shot.Dino.Breath.Land] unless block ^ ^ ^1 #mhdp_core:no_collision run scoreboard players set @s Mns.Shot.Timer 0
    execute unless block ^ ^ ^1 #mhdp_core:no_collision run tag @s add Mns.Shot.Dino.Breath.Land
    execute if entity @s[tag=!Mns.Shot.Dino.Breath.Land] run tp @s ^ ^ ^1
