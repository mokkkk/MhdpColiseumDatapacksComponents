#> mhdp_monster_valk:core/tick/animation/event/shoot_vertical_r/main
#
# アニメーションイベントハンドラ 翼叩きつけ
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 軸合わせ
    execute if score @s aj.shoot_vertical_r.frame matches 2 run function mhdp_monster_valk:core/tick/animation/event/shoot_vertical_r/turn_start
    execute if score @s aj.shoot_vertical_r.frame matches 11 run function mhdp_monster_valk:core/tick/animation/event/shoot_vertical_r/turn_start
    execute if score @s aj.shoot_vertical_r.frame matches 21 run function mhdp_monster_valk:core/tick/animation/event/shoot_vertical_r/turn_start
    execute if score @s aj.shoot_vertical_r.frame matches 2..30 run function mhdp_monsters:core/util/other/turn_to_target_rotate

# 移動
    execute if score @s aj.shoot_vertical_r.frame matches 1..19 if entity @n[tag=Mns.Target.Valk,distance=..11] at @s run tp @s ^ ^ ^-0.5
    execute if score @s aj.shoot_vertical_r.frame matches 6..19 unless entity @n[tag=Mns.Target.Valk,distance=..11] at @s run tp @s ^ ^ ^0.1
    execute if score @s aj.shoot_vertical_r.frame matches 20..30 unless entity @n[tag=Mns.Target.Valk,distance=..11] at @s run tp @s ^ ^ ^0.8
    execute if score @s aj.shoot_vertical_r.frame matches 45..51 run tp @s ~ ~ ~ ~-2 ~
    execute if score @s aj.shoot_vertical_r.frame matches 78..84 at @s run tp @s ^ ^ ^-0.2
    execute if score @s aj.shoot_vertical_r.frame matches 85..90 at @s run tp @s ^ ^ ^-0.1

# 効果音
    execute if score @s aj.shoot_vertical_r.frame matches 2..3 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 1.2 0.4
    execute if score @s aj.shoot_vertical_r.frame matches 2..3 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 0.7 0.4
    execute if score @s aj.shoot_vertical_r.frame matches 2..3 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 0.5 0.4
    execute if score @s aj.shoot_vertical_r.frame matches 2 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.allay.hurt master @s ^ ^1 ^1 0.4 1.5 0.4
    execute if score @s aj.shoot_vertical_r.frame matches 2 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.allay.hurt master @s ^ ^1 ^1 0.4 1.2 0.4
    execute if score @s aj.shoot_vertical_r.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.shoot_vertical_r.frame matches 29 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.shoot_vertical_r.frame matches 29 run playsound entity.player.attack.knockback master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.shoot_vertical_r.frame matches 29 run playsound entity.player.attack.knockback master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    execute if score @s aj.shoot_vertical_r.frame matches 29 run particle block{block_state:"minecraft:sand"} ^ ^ ^5 2 0.1 2 0 30
    execute if score @s aj.shoot_vertical_r.frame matches 42 run playsound item.firecharge.use master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.shoot_vertical_r.frame matches 48 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 2 0.1 2 0 30
    execute if score @s aj.shoot_vertical_r.frame matches 77 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.shoot_vertical_r.frame matches 94 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 2 0.1 2 0 30
    execute if score @s aj.shoot_vertical_r.frame matches 94 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.shoot_vertical_r.frame matches 107 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.shoot_vertical_r.frame matches 45..53 on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/shoot_vertical_r/m.particle with entity @s data.locators.pos_muzzle_r_0
    execute if score @s aj.shoot_vertical_r.frame matches 45..53 on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/shoot_vertical_r/m.particle with entity @s data.locators.pos_muzzle_r_1
    execute if score @s aj.shoot_vertical_r.frame matches 45..53 on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/shoot_vertical_r/m.particle with entity @s data.locators.pos_muzzle_r_2

# 演出
    execute if score @s aj.shoot_vertical_r.frame matches 53 run summon text_display ^-3 ^0 ^11 {Tags:["Mns.Shot.Valk","Mns.Shot.Valk.Vfx.RedFlash"],default_background:0b,brightness:{sky:15,block:15},text:'{"text":"0","font":"vfx/valstrax"}',transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[12f,12f,12f]},background:16777215,text_opacity:255,interpolation_duration:1,teleport_duration:2,text_opacity:255,billboard:"center",alignment:"left"}

# 攻撃
    execute if score @s aj.shoot_vertical_r.frame matches 29 run function mhdp_monster_valk:core/tick/animation/event/shoot_vertical_r/attack_hand
    execute if score @s aj.shoot_vertical_r.frame matches 51 positioned ^-3 ^1 ^9 run function mhdp_monster_valk:core/tick/animation/event/shoot_vertical_r/attack
    execute if score @s aj.shoot_vertical_r.frame matches 53 positioned ^-3 ^1 ^9 rotated ~ -90 run function mhdp_monster_valk:core/tick/animation/event/shoot_vertical_r/particle_ring

# モデル演出
    execute if score @s aj.shoot_vertical_r.frame matches 42 run function mhdp_monster_valk:core/util/models/ignite_start_right
    execute if score @s aj.shoot_vertical_r.frame matches 70 run function mhdp_monster_valk:core/util/models/ignite_end_right

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.shoot_vertical_r.frame matches 114 run function mhdp_monster_valk:core/tick/animation/event/shoot_vertical_r/end
