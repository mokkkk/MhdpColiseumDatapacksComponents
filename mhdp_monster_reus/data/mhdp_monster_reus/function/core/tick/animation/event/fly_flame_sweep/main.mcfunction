#> mhdp_monster_reus:core/tick/animation/event/fly_flame_sweep/main
#
# アニメーションイベントハンドラ なぎはらい火炎放射
#
# @within function mhdp_monster_reus:core/tick/animation/event/tick

# 軸合わせ
    execute if score @s aj.fly_flame_sweep.frame matches 1..30 run tag @n[tag=Mns.Target.Reus] add Temp.Rotate.Target
    execute if score @s aj.fly_flame_sweep.frame matches 1..30 at @s run function mhdp_monsters:core/util/other/turn_to_target_accurate

# 演出
    execute if score @s aj.fly_flame_sweep.frame matches 2 run playsound entity.player.breath master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.9
    execute if score @s aj.fly_flame_sweep.frame matches 6 run playsound entity.ender_dragon.flap master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.fly_flame_sweep.frame matches 20 run playsound entity.ender_dragon.flap master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.fly_flame_sweep.frame matches 66 run playsound entity.ender_dragon.flap master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.fly_flame_sweep.frame matches 2..34 on passengers if entity @s[tag=aj.data] run function mhdp_monster_reus:core/tick/animation/event/land_chargebite/head_effect with entity @s data.locators.pos_head

# 攻撃位置決定
    execute if score @s aj.fly_flame_sweep.frame matches 38 run summon area_effect_cloud ^ ^1 ^8 {Duration:25,DurationOnUse:0,Tags:["Mns.ShotPos.Reus"]}
    execute if score @s aj.fly_flame_sweep.frame matches 38 if entity @n[tag=Mns.Target.Reus,distance=8..25] at @n[tag=Mns.Target.Reus] run tp @n[type=area_effect_cloud,tag=Mns.ShotPos.Reus] ~ ~1 ~
    execute if score @s aj.fly_flame_sweep.frame matches 38 as @e[type=area_effect_cloud,tag=Mns.ShotPos.Reus] at @s if block ~ ~-0.3 ~ #mhdp_core:no_collision run function mhdp_monsters:core/util/other/on_ground
    execute if score @s aj.fly_flame_sweep.frame matches 38 as @e[type=area_effect_cloud,tag=Mns.ShotPos.Reus] at @s facing entity @n[type=item_display,tag=Mns.Root.Reus] feet rotated ~ 0 positioned ^14 ^ ^-0.5 run tp @s ~ ~ ~ ~ ~

# 攻撃
    execute if score @s aj.fly_flame_sweep.frame matches 40..53 run function mhdp_monster_reus:core/tick/animation/event/fly_flame_sweep/attack

# 接地
    execute if score @s aj.fly_flame_sweep.frame matches 1..62 at @s if block ~ ~-6.6 ~ #mhdp_core:no_collision at @s run tp @s ~ ~-0.1 ~ ~ ~
    execute if score @s aj.fly_flame_sweep.frame matches 1..62 at @s unless block ~ ~-6.5 ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~
    execute if score @s aj.fly_flame_sweep.frame matches 63.. at @s if block ~ ~-2.6 ~ #mhdp_core:no_collision at @s run tp @s ~ ~-0.2 ~ ~ ~
    execute if score @s aj.fly_flame_sweep.frame matches 63.. at @s unless block ~ ~-2.5 ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.fly_flame_sweep.frame matches 80 run function mhdp_monster_reus:core/tick/animation/event/fly_flame_sweep/end
