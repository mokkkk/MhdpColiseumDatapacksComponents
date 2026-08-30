#> mhdp_monster_valk:core/tick/animation/event/shoot_idle/main
#
# アニメーションイベントハンドラ 待機
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 効果音
    execute if score @s aj.shoot_idle.frame matches 12 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.shoot_idle.frame matches 36 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    # execute if score @s aj.shoot_idle.frame matches 12 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.allay.death master @s ^ ^1 ^1 0.4 0.9 0.4
    # execute if score @s aj.shoot_idle.frame matches 12 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.allay.death master @s ^ ^1 ^1 0.4 0.8 0.4
    # execute if score @s aj.shoot_idle.frame matches 12 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 1 0.4
    # execute if score @s aj.shoot_idle.frame matches 12 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 0.9 0.4
    # execute if score @s aj.shoot_idle.frame matches 36 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 1.2 0.4
    # execute if score @s aj.shoot_idle.frame matches 36 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 1.1 0.4

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.shoot_idle.frame matches 69 run function mhdp_monster_valk:core/tick/animation/event/shoot_idle/end
