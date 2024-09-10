#> mhdp_monster_valk:core/tick/animation/event/shoot_sault/main
#
# アニメーションイベントハンドラ 前方爆発
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 軸合わせ

# 移動
    
    execute if score @s aj.shoot_sault.frame matches 2..8 at @s run tp @s ^ ^ ^1
    execute if score @s aj.shoot_sault.frame matches 9..19 at @s run tp @s ^ ^ ^0.7
    execute if score @s aj.shoot_sault.frame matches 19 at @s run function mhdp_monster_valk:core/tick/animation/event/shoot_sault/move_start
    execute if score @s aj.shoot_sault.frame matches 20..33 at @s run function mhdp_monsters:core/util/other/move_to_target_move
    execute if score @s aj.shoot_sault.frame matches 20..25 at @s run tp @s ^ ^ ^ ~20 ~
    execute if score @s aj.shoot_sault.frame matches 26..33 at @s run tp @s ^ ^ ^ ~6 ~
    execute if score @s aj.shoot_sault.frame matches 34..42 at @s run tp @s ^ ^ ^-0.1 ~1 ~

# 効果音
    execute if score @s aj.shoot_sault.frame matches 2 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.allay.death master @s ^ ^1 ^1 0.4 1.7 0.4
    execute if score @s aj.shoot_sault.frame matches 2 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.allay.death master @s ^ ^1 ^1 0.4 1.8 0.4
    execute if score @s aj.shoot_sault.frame matches 2 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 2 0.4
    execute if score @s aj.shoot_sault.frame matches 2 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 1.8 0.4
    execute if score @s aj.shoot_sault.frame matches 2..5 run playsound entity.player.breath master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 2

    execute if score @s aj.shoot_sault.frame matches 2 run playsound entity.player.breath master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 2
    execute if score @s aj.shoot_sault.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.shoot_sault.frame matches 2 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 2 0.1 2 0 30
    execute if score @s aj.shoot_sault.frame matches 57..59 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 1.2 0.4
    execute if score @s aj.shoot_sault.frame matches 57..59 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 0.7 0.4
    execute if score @s aj.shoot_sault.frame matches 57..59 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 0.5 0.4
    execute if score @s aj.shoot_sault.frame matches 57 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.allay.hurt master @s ^ ^1 ^1 0.4 1.5 0.4
    execute if score @s aj.shoot_sault.frame matches 57 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.allay.hurt master @s ^ ^1 ^1 0.4 1.2 0.4
    execute if score @s aj.shoot_sault.frame matches 33 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.shoot_sault.frame matches 33 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 2 0.1 2 0 30
    execute if score @s aj.shoot_sault.frame matches 33..38 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.shoot_sault.frame matches 33..38 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 2 0.1 2 0 5

# 演出
    execute if score @s aj.shoot_sault.frame matches 2..16 run function mhdp_monster_valk:core/tick/animation/event/shoot_sault/particle

# 攻撃
    execute if score @s aj.shoot_sault.frame matches 17 run function mhdp_monster_valk:core/tick/animation/event/shoot_sault/attack

# 形態変化
    execute if score @s aj.shoot_sault.frame matches 53 run tag @s remove Mns.Valk.State.IsShoot

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.shoot_sault.frame matches 84 run function mhdp_monster_valk:core/tick/animation/event/shoot_sault/end
