#> mhdp_monster_valk:core/tick/animation/event/shoot_bomb_forward/main
#
# アニメーションイベントハンドラ 前方爆発
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 軸合わせ
    execute if score @s aj.shoot_bomb_forward.frame matches 2 run function mhdp_monster_valk:core/tick/animation/event/shoot_bomb_forward/turn_start
    execute if score @s aj.shoot_bomb_forward.frame matches 2..10 run function mhdp_monsters:core/util/other/turn_to_target_rotate

# 移動
    execute if score @s aj.shoot_bomb_forward.frame matches 40..56 at @s run tp @s ^ ^ ^-1.1
    execute if score @s aj.shoot_bomb_forward.frame matches 57..62 at @s run tp @s ^ ^ ^-0.2

# 効果音
    execute if score @s aj.shoot_bomb_forward.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.shoot_bomb_forward.frame matches 7 run playsound item.firecharge.use master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.shoot_bomb_forward.frame matches 15..17 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 1.2 0.4
    execute if score @s aj.shoot_bomb_forward.frame matches 15..17 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 0.7 0.4
    execute if score @s aj.shoot_bomb_forward.frame matches 15..17 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 0.5 0.4
    execute if score @s aj.shoot_bomb_forward.frame matches 15 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.allay.hurt master @s ^ ^1 ^1 0.4 1.5 0.4
    execute if score @s aj.shoot_bomb_forward.frame matches 15 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.allay.hurt master @s ^ ^1 ^1 0.4 1.2 0.4
    execute if score @s aj.shoot_bomb_forward.frame matches 55 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.shoot_bomb_forward.frame matches 55 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 2 0.1 2 0 30

# 演出
    execute if score @s aj.shoot_bomb_forward.frame matches 2..38 run function mhdp_monster_valk:core/tick/animation/event/shoot_bomb_forward/particle
    execute if score @s aj.shoot_bomb_forward.frame matches 19..38 run function mhdp_monster_valk:core/tick/animation/event/shoot_bomb_forward/particle_2
    execute if score @s aj.shoot_bomb_forward.frame matches 82 run playsound item.axe.scrape master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 2
    execute if score @s aj.shoot_bomb_forward.frame matches 82 run playsound item.axe.scrape master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 2
    execute if score @s aj.shoot_bomb_forward.frame matches 82 run playsound item.axe.scrape master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 2
    execute if score @s aj.shoot_bomb_forward.frame matches 82 run playsound item.trident.return master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.2

# 攻撃
    execute if score @s aj.shoot_bomb_forward.frame matches 39 run function mhdp_monster_valk:core/tick/animation/event/shoot_bomb_forward/attack

# 形態変化
    execute if score @s aj.shoot_bomb_forward.frame matches 53 run tag @s remove Mns.Valk.State.IsShoot

# モデル演出
    execute if score @s aj.shoot_bomb_forward.frame matches 2 run function mhdp_monster_valk:core/util/models/ignite_start
    execute if score @s aj.shoot_bomb_forward.frame matches 75 run function mhdp_monster_valk:core/util/models/ignite_end

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.shoot_bomb_forward.frame matches 95 run function mhdp_monster_valk:core/tick/animation/event/shoot_bomb_forward/end
