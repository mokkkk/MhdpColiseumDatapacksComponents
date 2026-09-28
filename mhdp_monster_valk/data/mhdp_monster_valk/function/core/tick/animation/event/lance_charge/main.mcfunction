#> mhdp_monster_valk:core/tick/animation/event/lance_charge/main
#
# アニメーションイベントハンドラ 龍気吸引
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 効果音
    execute if score @s aj.lance_charge.frame matches 2..15 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.allay.death master @s ^ ^1 ^1 0.3 1.7 0.3
    execute if score @s aj.lance_charge.frame matches 2..15 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.allay.death master @s ^ ^1 ^1 0.3 1.8 0.3
    execute if score @s aj.lance_charge.frame matches 2..25 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.3 2 0.3
    execute if score @s aj.lance_charge.frame matches 2..25 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.3 1.8 0.3
    execute if score @s aj.lance_charge.frame matches 2..35 run playsound entity.player.breath master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 2
    particle crimson_spore ~ ~2 ~ 3 2 3 1 10
    particle cloud ~ ~2 ~ 3 2 3 0.1 1
    function mhdp_monster_valk:core/tick/animation/event/lance_charge/particle
    execute if score @s aj.lance_charge.frame matches 2 positioned ~ ~1 ~ run function mhdp_monster_valk:core/tick/animation/event/lance_charge/particle_ring
    execute if score @s aj.lance_charge.frame matches 22 positioned ~ ~1 ~ run function mhdp_monster_valk:core/tick/animation/event/lance_charge/particle_ring

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 終了
    execute if score @s aj.lance_charge.frame matches 44 run function mhdp_monster_valk:core/tick/animation/event/lance_charge/end
