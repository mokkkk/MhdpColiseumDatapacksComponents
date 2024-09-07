#> mhdp_monster_valk:core/tick/animation/event/shoot_vertical_l/main
#
# アニメーションイベントハンドラ 翼叩きつけ
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 軸合わせ
    execute if score @s aj.shoot_vertical_l.frame matches 2 run function mhdp_monster_valk:core/tick/animation/event/shoot_vertical_l/turn_start
    execute if score @s aj.shoot_vertical_l.frame matches 11 run function mhdp_monster_valk:core/tick/animation/event/shoot_vertical_l/turn_start
    execute if score @s aj.shoot_vertical_l.frame matches 21 run function mhdp_monster_valk:core/tick/animation/event/shoot_vertical_l/turn_start
    execute if score @s aj.shoot_vertical_l.frame matches 2..30 run function mhdp_monsters:core/util/other/turn_to_target_rotate

# 移動
    execute if score @s aj.shoot_vertical_l.frame matches 1..19 if entity @n[tag=Mns.Target.Valk,distance=..11] at @s run tp @s ^ ^ ^-0.5
    execute if score @s aj.shoot_vertical_l.frame matches 6..19 unless entity @n[tag=Mns.Target.Valk,distance=..8] at @s run tp @s ^ ^ ^0.1
    execute if score @s aj.shoot_vertical_l.frame matches 20..30 unless entity @n[tag=Mns.Target.Valk,distance=..8] at @s run tp @s ^ ^ ^0.4
    execute if score @s aj.shoot_vertical_l.frame matches 45..51 run tp @s ~ ~ ~ ~2 ~
    execute if score @s aj.shoot_vertical_l.frame matches 78..84 at @s run tp @s ^ ^ ^-0.2
    execute if score @s aj.shoot_vertical_l.frame matches 85..90 at @s run tp @s ^ ^ ^-0.1

# 効果音
    execute if score @s aj.shoot_vertical_l.frame matches 2..3 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 1.2 0.4
    execute if score @s aj.shoot_vertical_l.frame matches 2..3 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 0.7 0.4
    execute if score @s aj.shoot_vertical_l.frame matches 2..3 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 0.5 0.4
    execute if score @s aj.shoot_vertical_l.frame matches 2 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.allay.hurt master @s ^ ^1 ^1 0.4 1.5 0.4
    execute if score @s aj.shoot_vertical_l.frame matches 2 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.allay.hurt master @s ^ ^1 ^1 0.4 1.2 0.4
    execute if score @s aj.shoot_vertical_l.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.shoot_vertical_l.frame matches 29 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.shoot_vertical_l.frame matches 29 run playsound entity.player.attack.knockback master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.shoot_vertical_l.frame matches 29 run playsound entity.player.attack.knockback master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    execute if score @s aj.shoot_vertical_l.frame matches 29 run particle block{block_state:"minecraft:sand"} ^ ^ ^5 2 0.1 2 0 30
    execute if score @s aj.shoot_vertical_l.frame matches 42 run playsound item.firecharge.use master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.shoot_vertical_l.frame matches 48 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 2 0.1 2 0 30
    execute if score @s aj.shoot_vertical_l.frame matches 77 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.shoot_vertical_l.frame matches 94 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 2 0.1 2 0 30
    execute if score @s aj.shoot_vertical_l.frame matches 94 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.shoot_vertical_l.frame matches 107 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.shoot_vertical_l.frame matches 45..53 on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/shoot_vertical_l/m.particle with entity @s data.locators.pos_muzzle_l_0
    execute if score @s aj.shoot_vertical_l.frame matches 45..53 on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/shoot_vertical_l/m.particle with entity @s data.locators.pos_muzzle_l_1
    execute if score @s aj.shoot_vertical_l.frame matches 45..53 on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/shoot_vertical_l/m.particle with entity @s data.locators.pos_muzzle_l_2

# 攻撃
    execute if score @s aj.shoot_vertical_l.frame matches 29 run function mhdp_monster_valk:core/tick/animation/event/shoot_vertical_l/attack_hand
    execute if score @s aj.shoot_vertical_l.frame matches 51 positioned ^3 ^1 ^9 run function mhdp_monster_valk:core/tick/animation/event/shoot_vertical_l/attack
    execute if score @s aj.shoot_vertical_l.frame matches 53 positioned ^3 ^1 ^9 rotated ~ -90 run function mhdp_monster_valk:core/tick/animation/event/shoot_vertical_l/particle_ring

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.shoot_vertical_l.frame matches 124 run function mhdp_monster_valk:core/tick/animation/event/shoot_vertical_l/end
