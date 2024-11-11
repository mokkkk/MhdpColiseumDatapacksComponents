#> mhdp_monster_valk:core/tick/animation/event/lance_upper_l/main
#
# アニメーションイベントハンドラ 翼槍突き上げ
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 軸合わせ
    execute if score @s aj.lance_upper_l.frame matches 2 run function mhdp_monster_valk:core/tick/animation/event/lance_upper_l/turn_start_0
    execute if score @s aj.lance_upper_l.frame matches 11 run function mhdp_monster_valk:core/tick/animation/event/lance_upper_l/turn_start_0
    execute if score @s aj.lance_upper_l.frame matches 2..15 run function mhdp_monsters:core/util/other/turn_to_target_rotate
    execute if score @s aj.lance_upper_l.frame matches 37..44 run tag @n[tag=Mns.Target.Valk] add Temp.Rotate.Target
    execute if score @s aj.lance_upper_l.frame matches 37..44 run function mhdp_monsters:core/util/other/turn_to_target_accurate
    execute if score @s aj.lance_upper_l.frame matches 45..50 at @s run tp @s ^ ^ ^ ~0.6 ~ 

# 移動
    execute if score @s aj.lance_upper_l.frame matches 1..5 if entity @n[tag=Mns.Target.Valk,distance=..15] at @s run tp @s ^ ^ ^-0.5
    execute if score @s aj.lance_upper_l.frame matches 6..10 if entity @n[tag=Mns.Target.Valk,distance=..15] at @s run tp @s ^ ^ ^-0.3
    execute if score @s aj.lance_upper_l.frame matches 11..19 unless entity @n[tag=Mns.Target.Valk,distance=..8] at @s run tp @s ^ ^ ^0.4 ~-1 ~
    execute if score @s aj.lance_upper_l.frame matches 34..40 at @s run tp @s ^ ^ ^-0.7
    execute if score @s aj.lance_upper_l.frame matches 34..50 at @s run tp @s ^ ^ ^-0.1
    execute if score @s aj.lance_upper_l.frame matches 51..58 at @s run tp @s ^ ^ ^0.7
    execute if score @s aj.lance_upper_l.frame matches 59..69 at @s run tp @s ^ ^ ^0.4
    execute if score @s aj.lance_upper_l.frame matches 71..85 at @s run tp @s ^ ^ ^0.3

# 効果音
    execute if score @s aj.lance_upper_l.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.lance_upper_l.frame matches 20 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_upper_l.frame matches 20 run playsound entity.player.attack.knockback master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_upper_l.frame matches 20 run playsound entity.player.attack.knockback master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    execute if score @s aj.lance_upper_l.frame matches 20 run particle block{block_state:"minecraft:sand"} ^ ^ ^5 2 0.1 2 0 30
    execute if score @s aj.lance_upper_l.frame matches 30..32 run playsound item.firecharge.use master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5

    execute if score @s aj.lance_upper_l.frame matches 35..55 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.allay.death master @s ^ ^1 ^1 0.3 1.7 0.3
    execute if score @s aj.lance_upper_l.frame matches 35..55 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.allay.death master @s ^ ^1 ^1 0.3 1.8 0.3
    execute if score @s aj.lance_upper_l.frame matches 35..55 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.3 2 0.3
    execute if score @s aj.lance_upper_l.frame matches 35..55 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.3 1.8 0.3
    execute if score @s aj.lance_upper_l.frame matches 35..40 run playsound entity.player.breath master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 2

    execute if score @s aj.lance_upper_l.frame matches 86 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_upper_l.frame matches 35..49 on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/lance_upper_l/m.particle_charge with entity @s data.locators.pos_wing_l_3
    execute if score @s aj.lance_upper_l.frame matches 50..67 on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/lance_upper_l/m.particle with entity @s data.locators.pos_wing_l_3

    execute if score @s aj.lance_upper_l.frame matches 35 positioned ^4 ^ ^-3 run summon text_display ^-1 ^ ^ {Tags:["Mns.Shot.Valk","Mns.Shot.Valk.Vfx.RedFlash","Mns.Shot.Valk.Vfx.RedFlash.Long"],default_background:0b,brightness:{sky:15,block:15},text:'{"text":"0","font":"vfx/valstrax"}',transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[7f,7f,7f]},background:16777215,text_opacity:255,interpolation_duration:1,teleport_duration:2,text_opacity:255,billboard:"center",alignment:"left"}
    execute if score @s aj.lance_upper_l.frame matches 35..51 run tp @n[type=text_display,tag=Mns.Shot.Valk.Vfx.RedFlash,tag=Mns.Shot.Valk.Vfx.RedFlash.Long] ^4 ^2 ^-5
    execute if score @s aj.lance_upper_l.frame matches 51 run kill @e[type=text_display,tag=Mns.Shot.Valk.Vfx.RedFlash.Long]
    execute if score @s aj.lance_upper_l.frame matches 51 positioned ^4 ^2 ^-5 run summon text_display ^-1 ^ ^ {Tags:["Mns.Shot.Valk","Mns.Shot.Valk.Vfx.RedFlash"],default_background:0b,brightness:{sky:15,block:15},text:'{"text":"0","font":"vfx/valstrax"}',transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[12f,12f,12f]},background:16777215,text_opacity:255,interpolation_duration:1,teleport_duration:2,text_opacity:255,billboard:"center",alignment:"left"}

# 攻撃
    execute if score @s aj.lance_upper_l.frame matches 20 run function mhdp_monster_valk:core/tick/animation/event/lance_upper_l/attack_hand
    execute if score @s aj.lance_upper_l.frame matches 56 positioned ^1.2 ^1 ^7 rotated ~3 ~ run function mhdp_monster_valk:core/tick/animation/event/lance_upper_l/attack

# モデル演出
    execute if score @s aj.lance_upper_l.frame matches 37 run function mhdp_monster_valk:core/util/models/ignite_start_right
    execute if score @s aj.lance_upper_l.frame matches 90 run function mhdp_monster_valk:core/util/models/ignite_end_right

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 状態更新
   execute if score @s aj.lance_upper_l.frame matches 53 run tag @s add Mns.Valk.State.Attack.Wing.L
   execute if score @s aj.lance_upper_l.frame matches 59 run tag @s remove Mns.Valk.State.Attack.Wing.L

# 終了
    execute if score @s aj.lance_upper_l.frame matches 99 run function mhdp_monster_valk:core/tick/animation/event/lance_upper_l/end
