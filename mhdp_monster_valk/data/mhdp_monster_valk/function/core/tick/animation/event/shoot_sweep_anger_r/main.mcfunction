#> mhdp_monster_valk:core/tick/animation/event/shoot_sweep_anger_r/main
#
# アニメーションイベントハンドラ 薙ぎ払い
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 軸合わせ
    execute if score @s aj.shoot_sweep_anger_r.frame matches 2 run function mhdp_monster_valk:core/tick/animation/event/shoot_sweep_anger_r/turn_start
    execute if score @s aj.shoot_sweep_anger_r.frame matches 11 run function mhdp_monster_valk:core/tick/animation/event/shoot_sweep_anger_r/turn_start
    execute if score @s aj.shoot_sweep_anger_r.frame matches 2..20 run function mhdp_monsters:core/util/other/turn_to_target_rotate

# 移動
    execute if score @s aj.shoot_sweep_anger_r.frame matches 49..57 run tp @s ~ ~ ~ ~-8 ~

# 効果音
    execute if score @s aj.shoot_sweep_anger_r.frame matches 2..3 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 1.2 0.4
    execute if score @s aj.shoot_sweep_anger_r.frame matches 2..3 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 0.7 0.4
    execute if score @s aj.shoot_sweep_anger_r.frame matches 2..3 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 0.5 0.4
    execute if score @s aj.shoot_sweep_anger_r.frame matches 2 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.allay.hurt master @s ^ ^1 ^1 0.4 1.5 0.4
    execute if score @s aj.shoot_sweep_anger_r.frame matches 2 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.allay.hurt master @s ^ ^1 ^1 0.4 1.2 0.4
    execute if score @s aj.shoot_sweep_anger_r.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.shoot_sweep_anger_r.frame matches 48 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.shoot_sweep_anger_r.frame matches 48 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s aj.shoot_sweep_anger_r.frame matches 48 run playsound entity.breeze.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.shoot_sweep_anger_r.frame matches 79 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.shoot_sweep_anger_r.frame matches 50 run playsound item.trident.return master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.2
    execute if score @s aj.shoot_sweep_anger_r.frame matches 50 run playsound item.trident.return master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.2
    execute if score @s aj.shoot_sweep_anger_r.frame matches 50 run playsound item.trident.return master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.2

    execute if score @s aj.shoot_sweep_anger_r.frame matches 2 run playsound item.firecharge.use master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.6
    execute if score @s aj.shoot_sweep_anger_r.frame matches 28..47 run function mhdp_monster_valk:core/tick/animation/event/shoot_sweep_anger_r/particle
    
# 攻撃
    execute if score @s aj.shoot_sweep_anger_r.frame matches 49..57 run function mhdp_monster_valk:core/tick/animation/event/shoot_sweep_anger_r/attack
    execute if score @s aj.shoot_sweep_anger_r.frame matches 49..53 run particle block{block_state:"minecraft:sand"} ^3 ^ ^8 2 0.1 2 0 10
    execute if score @s aj.shoot_sweep_anger_r.frame matches 54..57 run particle block{block_state:"minecraft:sand"} ^ ^ ^8 2 0.1 2 0 10

# モデル演出
    execute if score @s aj.shoot_sweep_anger_r.frame matches 5 run function mhdp_monster_valk:core/util/models/ignite_start_right
    execute if score @s aj.shoot_sweep_anger_r.frame matches 62 run function mhdp_monster_valk:core/util/models/ignite_end_right

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 状態更新
   execute if score @s aj.shoot_sweep_anger_r.frame matches 45 run tag @s add Mns.Valk.State.Attack.Wing.R
   execute if score @s aj.shoot_sweep_anger_r.frame matches 60 run tag @s remove Mns.Valk.State.Attack.Wing.R

# 終了
    execute if score @s aj.shoot_sweep_anger_r.frame matches 95 run function mhdp_monster_valk:core/tick/animation/event/shoot_sweep_anger_r/end
