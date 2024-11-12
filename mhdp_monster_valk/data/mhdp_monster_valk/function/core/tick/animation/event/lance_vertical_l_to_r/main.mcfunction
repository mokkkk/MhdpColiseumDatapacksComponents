#> mhdp_monster_valk:core/tick/animation/event/lance_vertical_l_to_r/main
#
# アニメーションイベントハンドラ 翼槍叩きつけ
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 軸合わせ
    execute if score @s aj.lance_vertical_l_to_r.frame matches 2 run function mhdp_monster_valk:core/tick/animation/event/lance_vertical_l_to_r/turn_start
    execute if score @s aj.lance_vertical_l_to_r.frame matches 5..14 run function mhdp_monsters:core/util/other/turn_to_target_rotate

# 移動
    execute if score @s aj.lance_vertical_l_to_r.frame matches 1..8 if entity @n[tag=Mns.Target.Valk,distance=..9] at @s run tp @s ^ ^ ^-0.5
    execute if score @s aj.lance_vertical_l_to_r.frame matches 9..15 unless entity @n[tag=Mns.Target.Valk,distance=..12] at @s run tp @s ^ ^ ^1.2
    execute if score @s aj.lance_vertical_l_to_r.frame matches 16..20 unless entity @n[tag=Mns.Target.Valk,distance=..8] at @s run tp @s ^ ^ ^0.8
    execute if score @s aj.lance_vertical_l_to_r.frame matches 52..62 at @s run tp @s ^ ^ ^-0.1
    execute if score @s aj.lance_vertical_l_to_r.frame matches 63..68 at @s run tp @s ^ ^ ^-0.05

# 効果音
    execute if score @s aj.lance_vertical_l_to_r.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.lance_vertical_l_to_r.frame matches 9 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 2 0.1 2 0 30
    execute if score @s aj.lance_vertical_l_to_r.frame matches 9 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.lance_vertical_l_to_r.frame matches 10 run playsound item.firecharge.use master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_vertical_l_to_r.frame matches 20 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_vertical_l_to_r.frame matches 20 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 2 0.1 2 0 30
    execute if score @s aj.lance_vertical_l_to_r.frame matches 47 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.lance_vertical_l_to_r.frame matches 68 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.lance_vertical_l_to_r.frame matches 68 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 2 0.1 2 0 30
    execute if score @s aj.lance_vertical_l_to_r.frame matches 81 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_vertical_l_to_r.frame matches 96 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_vertical_l_to_r.frame matches 11..20 on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/lance_spear_l_to_r/m.particle with entity @s data.locators.pos_wing_r_3

# 演出
    execute if score @s aj.lance_vertical_l_to_r.frame matches 11 run summon text_display ^2 ^1 ^-6 {Tags:["Mns.Shot.Valk","Mns.Shot.Valk.Vfx.RedFlash"],default_background:0b,brightness:{sky:15,block:15},text:'{"text":"0","font":"vfx/valstrax"}',transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[8f,8f,8f]},background:16777215,text_opacity:255,interpolation_duration:1,teleport_duration:2,text_opacity:255,billboard:"center",alignment:"left"}

# 攻撃
    execute if score @s aj.lance_vertical_l_to_r.frame matches 20 positioned ^-1.2 ^1 ^7 run function mhdp_monster_valk:core/tick/animation/event/lance_vertical_l_to_r/attack
    execute if score @s aj.lance_vertical_l_to_r.frame matches 24 positioned ^-1.2 ^1 ^7 rotated ~ -90 run function mhdp_monster_valk:core/tick/animation/event/lance_vertical_l_to_r/particle_ring

# モデル演出
    execute if score @s aj.lance_vertical_l_to_r.frame matches 10 run function mhdp_monster_valk:core/util/models/ignite_start_right
    execute if score @s aj.lance_vertical_l_to_r.frame matches 32 run function mhdp_monster_valk:core/util/models/ignite_end_right

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 状態更新
   execute if score @s aj.lance_vertical_l_to_r.frame matches 18 run tag @s add Mns.Valk.State.Attack.Wing.R
   execute if score @s aj.lance_vertical_l_to_r.frame matches 23 run tag @s remove Mns.Valk.State.Attack.Wing.R

# 終了
    execute if score @s aj.lance_vertical_l_to_r.frame matches 95 run function mhdp_monster_valk:core/tick/animation/event/lance_vertical_l_to_r/end
