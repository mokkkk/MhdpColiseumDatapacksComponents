#> mhdp_monster_valk:core/tick/animation/event/comet_phase_4/main
#
# アニメーションイベントハンドラ 彗星・着陸
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 移動
    execute if score @s aj.comet_phase_4.frame matches 2..10 at @s run tp @s ^0.5 ^ ^-2
    execute if score @s aj.comet_phase_4.frame matches 11..24 at @s run tp @s ^ ^ ^-0.8 ~-5 ~
    execute if score @s aj.comet_phase_4.frame matches 25..40 at @s run tp @s ^ ^ ^-0.2 ~-0.5 ~
    execute if score @s aj.comet_phase_4.frame matches 41..55 at @s run tp @s ^ ^ ^-0.07 ~-0.2 ~

# 効果音
    execute if score @s aj.comet_phase_4.frame matches 2 run stopsound @a[tag=Ply.State.MnsTarget] master
    execute if score @s aj.comet_phase_4.frame matches 2..55 run function mhdp_monster_valk:core/tick/animation/event/comet_phase_4/particle
    execute if score @s aj.comet_phase_4.frame matches 11..40 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.comet_phase_4.frame matches 11..40 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 1 0.1 1 0 10
    execute if score @s aj.comet_phase_4.frame matches 55 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.comet_phase_4.frame matches 72 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.comet_phase_4.frame matches 72 run particle block{block_state:"minecraft:sand"} ^ ^ ^6 1 0.1 1 0 10

# 演出
    execute if score @s aj.comet_phase_4.frame matches 2..15 run particle dust{color:[1.000,0.112,0.312],scale:4} ^ ^ ^3 2 2 2 0.15 10 force
    execute if score @s aj.comet_phase_4.frame matches 2..15 run particle explosion ^ ^2 ^6 2 2 2 0 10 force
    execute if score @s aj.comet_phase_4.frame matches 2..5 run particle gust_emitter_large ~ ~2 ~ 3 1 3 0 3 force
    execute if score @s aj.comet_phase_4.frame matches 2..15 at @s on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/comet_phase_4/m.tp_vfx_jet with entity @s data.locators.shadow
    execute if score @s aj.comet_phase_4.frame matches 2 run data modify entity @n[type=text_display,tag=Mns.Shot.Valk.Vfx.Jet] transformation.scale set value [50f,50f,50f]
    execute if score @s aj.comet_phase_4.frame matches 2 run data modify entity @n[type=text_display,tag=Mns.Shot.Valk.Vfx.Jet] start_interpolation set value -1L
    # execute if score @s aj.comet_phase_4.frame matches 6 run data modify entity @n[type=text_display,tag=Mns.Shot.Valk.Vfx.Jet] transformation.scale set value [6f,6f,6f]
    # execute if score @s aj.comet_phase_4.frame matches 6 run data modify entity @n[type=text_display,tag=Mns.Shot.Valk.Vfx.Jet] start_interpolation set value -1L
    execute if score @s aj.comet_phase_4.frame matches 8 run kill @e[type=text_display,tag=Mns.Shot.Valk.Vfx.Jet]

    execute if score @s aj.comet_phase_4.frame matches 2 run summon text_display ^ ^2 ^ {Tags:["Mns.Shot.Valk","Mns.Shot.Valk.Vfx.RedFlash"],default_background:0b,brightness:{sky:15,block:15},text:'{"text":"0","font":"vfx/valstrax"}',transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[18f,18f,18f]},background:16777215,text_opacity:255,interpolation_duration:1,teleport_duration:2,text_opacity:255,billboard:"center",alignment:"left"}
    execute if score @s aj.comet_phase_4.frame matches 4 run summon text_display ^ ^2 ^ {Tags:["Mns.Shot.Valk","Mns.Shot.Valk.Vfx.RedFlash"],default_background:0b,brightness:{sky:15,block:15},text:'{"text":"0","font":"vfx/valstrax"}',transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[18f,18f,18f]},background:16777215,text_opacity:255,interpolation_duration:1,teleport_duration:2,text_opacity:255,billboard:"center",alignment:"left"}
    execute if score @s aj.comet_phase_4.frame matches 6 run summon text_display ^ ^2 ^ {Tags:["Mns.Shot.Valk","Mns.Shot.Valk.Vfx.RedFlash"],default_background:0b,brightness:{sky:15,block:15},text:'{"text":"0","font":"vfx/valstrax"}',transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[18f,18f,18f]},background:16777215,text_opacity:255,interpolation_duration:1,teleport_duration:2,text_opacity:255,billboard:"center",alignment:"left"}
    execute if score @s aj.comet_phase_4.frame matches 8 run summon text_display ^ ^2 ^ {Tags:["Mns.Shot.Valk","Mns.Shot.Valk.Vfx.RedFlash"],default_background:0b,brightness:{sky:15,block:15},text:'{"text":"0","font":"vfx/valstrax"}',transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[18f,18f,18f]},background:16777215,text_opacity:255,interpolation_duration:1,teleport_duration:2,text_opacity:255,billboard:"center",alignment:"left"}

# 無音
    execute if score @s aj.comet_phase_4.frame matches 2..5 run playsound item.trident.thunder master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 1.2
    execute if score @s aj.comet_phase_4.frame matches 2..5 run playsound item.trident.thunder master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 1
    execute if score @s aj.comet_phase_4.frame matches 5 run tag @a[tag=Ply.State.MnsTarget] add Ply.State.IsSilent
    execute if score @s aj.comet_phase_4.frame matches 65 run tag @a[tag=Ply.State.MnsTarget] remove Ply.State.IsSilent

# 攻撃
    execute if score @s aj.comet_phase_4.frame matches 2 run function mhdp_monster_valk:core/tick/animation/event/comet_phase_4/attack

# モデル演出
    execute if score @s aj.comet_phase_4.frame matches 55 run function mhdp_monster_valk:core/util/models/ignite_end

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.comet_phase_4.frame matches 93 run function mhdp_monster_valk:core/tick/animation/event/comet_phase_4/end
