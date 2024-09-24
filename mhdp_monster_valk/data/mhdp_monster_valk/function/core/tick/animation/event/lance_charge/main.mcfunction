#> mhdp_monster_valk:core/tick/animation/event/lance_charge/main
#
# アニメーションイベントハンドラ 龍気吸引
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 効果音
    execute if score @s aj.lance_charge.frame matches 2..15 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.allay.death master @s ^ ^1 ^1 0.4 1.7 0.4
    execute if score @s aj.lance_charge.frame matches 2..15 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.allay.death master @s ^ ^1 ^1 0.4 1.8 0.4
    execute if score @s aj.lance_charge.frame matches 2..25 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 2 0.4
    execute if score @s aj.lance_charge.frame matches 2..25 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 1.8 0.4
    execute if score @s aj.lance_charge.frame matches 2..35 run playsound entity.player.breath master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 2
    particle crimson_spore ~ ~2 ~ 3 2 3 1 10
    particle cloud ~ ~2 ~ 3 2 3 0.1 1
    function mhdp_monster_valk:core/tick/animation/event/lance_charge/particle
    execute if score @s aj.lance_charge.frame matches 2 positioned ~ ~1 ~ run function mhdp_monster_valk:core/tick/animation/event/lance_charge/particle_ring
    execute if score @s aj.lance_charge.frame matches 22 positioned ~ ~1 ~ run function mhdp_monster_valk:core/tick/animation/event/lance_charge/particle_ring

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    # execute if score @s aj.lance_charge.frame matches 44 run return run function animated_java:valk_aj/animations/lance_charge_damage/tween {duration:1, to_frame: 1}
    execute if score @s aj.lance_charge.frame matches 44 run function mhdp_monster_valk:core/tick/animation/event/lance_charge/end
