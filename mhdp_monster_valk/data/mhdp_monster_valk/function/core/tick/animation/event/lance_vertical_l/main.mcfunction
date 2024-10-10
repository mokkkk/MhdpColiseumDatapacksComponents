#> mhdp_monster_valk:core/tick/animation/event/lance_vertical_l/main
#
# アニメーションイベントハンドラ 翼槍叩きつけ
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 軸合わせ
    execute if score @s aj.lance_vertical_l.frame matches 2 run function mhdp_monster_valk:core/tick/animation/event/lance_vertical_l/turn_start
    execute if score @s aj.lance_vertical_l.frame matches 11 run function mhdp_monster_valk:core/tick/animation/event/lance_vertical_l/turn_start
    execute if score @s aj.lance_vertical_l.frame matches 2..15 run function mhdp_monsters:core/util/other/turn_to_target_rotate
    execute if score @s aj.lance_vertical_l.frame matches 33 run function mhdp_monster_valk:core/tick/animation/event/lance_vertical_l/turn_start
    execute if score @s aj.lance_vertical_l.frame matches 33..42 run function mhdp_monsters:core/util/other/turn_to_target_rotate

# 移動
    execute if score @s aj.lance_vertical_l.frame matches 1..5 if entity @n[tag=Mns.Target.Valk,distance=..15] at @s run tp @s ^ ^ ^-0.5
    execute if score @s aj.lance_vertical_l.frame matches 6..10 if entity @n[tag=Mns.Target.Valk,distance=..15] at @s run tp @s ^ ^ ^-0.3
    execute if score @s aj.lance_vertical_l.frame matches 11..19 unless entity @n[tag=Mns.Target.Valk,distance=..8] at @s run tp @s ^ ^ ^0.4 ~-1 ~
    execute if score @s aj.lance_vertical_l.frame matches 34..38 if entity @n[tag=Mns.Target.Valk,distance=..12] at @s run tp @s ^ ^ ^-0.3
    execute if score @s aj.lance_vertical_l.frame matches 39..48 unless entity @n[tag=Mns.Target.Valk,distance=..8] at @s run tp @s ^ ^ ^0.8
    execute if score @s aj.lance_vertical_l.frame matches 80..90 at @s run tp @s ^ ^ ^-0.2
    execute if score @s aj.lance_vertical_l.frame matches 91..96 at @s run tp @s ^ ^ ^-0.1

# 効果音
    execute if score @s aj.lance_vertical_l.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.lance_vertical_l.frame matches 20 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_vertical_l.frame matches 20 run playsound entity.player.attack.knockback master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_vertical_l.frame matches 20 run playsound entity.player.attack.knockback master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    execute if score @s aj.lance_vertical_l.frame matches 20 run particle block{block_state:"minecraft:sand"} ^ ^ ^5 2 0.1 2 0 30
    execute if score @s aj.lance_vertical_l.frame matches 38 run playsound item.firecharge.use master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_vertical_l.frame matches 37..38 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 1.2 0.4
    execute if score @s aj.lance_vertical_l.frame matches 37..38 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 0.7 0.4
    execute if score @s aj.lance_vertical_l.frame matches 37..38 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 0.5 0.4
    execute if score @s aj.lance_vertical_l.frame matches 37 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.allay.hurt master @s ^ ^1 ^1 0.4 1.5 0.4
    execute if score @s aj.lance_vertical_l.frame matches 37 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.allay.hurt master @s ^ ^1 ^1 0.4 1.2 0.4
    execute if score @s aj.lance_vertical_l.frame matches 37 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 2 0.1 2 0 30
    execute if score @s aj.lance_vertical_l.frame matches 37 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.lance_vertical_l.frame matches 48 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 2 0.1 2 0 30
    execute if score @s aj.lance_vertical_l.frame matches 75 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.lance_vertical_l.frame matches 96 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.lance_vertical_l.frame matches 96 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 2 0.1 2 0 30
    execute if score @s aj.lance_vertical_l.frame matches 109 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_vertical_l.frame matches 124 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_vertical_l.frame matches 39..48 on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/lance_spear_l_to_r/m.particle with entity @s data.locators.pos_wing_l_3

# 演出
    execute if score @s aj.lance_vertical_l.frame matches 38 run summon text_display ^-2 ^1 ^-6 {Tags:["Mns.Shot.Valk","Mns.Shot.Valk.Vfx.RedFlash"],default_background:0b,brightness:{sky:15,block:15},text:'{"text":"0","font":"vfx/valstrax"}',transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[8f,8f,8f]},background:16777215,text_opacity:255,interpolation_duration:1,teleport_duration:2,text_opacity:255,billboard:"center",alignment:"left"}

# 攻撃
    execute if score @s aj.lance_vertical_l.frame matches 20 run function mhdp_monster_valk:core/tick/animation/event/lance_vertical_l/attack_hand
    execute if score @s aj.lance_vertical_l.frame matches 48 positioned ^1.2 ^1 ^7 run function mhdp_monster_valk:core/tick/animation/event/lance_vertical_l/attack
    execute if score @s aj.lance_vertical_l.frame matches 52 positioned ^1.2 ^1 ^7 rotated ~ -90 run function mhdp_monster_valk:core/tick/animation/event/lance_vertical_l/particle_ring

# モデル演出
    execute if score @s aj.lance_vertical_l.frame matches 33 run function mhdp_monster_valk:core/util/models/ignite_start_left
    execute if score @s aj.lance_vertical_l.frame matches 65 run function mhdp_monster_valk:core/util/models/ignite_end_left

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 2連
    execute if entity @s[tag=Mns.State.IsAnger] if score @s aj.lance_vertical_l.frame matches 65 run function animated_java:valk_aj/animations/lance_vertical_l_to_r/tween {duration:1, to_frame: 1}

# 終了
    execute if score @s aj.lance_vertical_l.frame matches 124 run function mhdp_monster_valk:core/tick/animation/event/lance_vertical_l/end
