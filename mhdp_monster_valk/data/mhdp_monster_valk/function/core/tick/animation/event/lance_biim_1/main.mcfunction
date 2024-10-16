#> mhdp_monster_valk:core/tick/animation/event/lance_biim_1/main
#
# アニメーションイベントハンドラ 龍閃
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 軸合わせ
    execute if score @s aj.lance_biim_1.frame matches 1..52 run tag @n[tag=Mns.Target.Valk] add Temp.Rotate.Target
    execute if score @s aj.lance_biim_1.frame matches 1..52 run function mhdp_monsters:core/util/other/turn_to_target_accurate

# 効果音
    execute if score @s aj.lance_biim_1.frame matches 1..8 if entity @n[tag=Mns.Target.Valk,distance=..15] at @s run tp @s ^ ^ ^-0.5
    execute if score @s aj.lance_biim_1.frame matches 2..10 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.allay.death master @s ^ ^1 ^1 0.3 1.7 0.3
    execute if score @s aj.lance_biim_1.frame matches 2..10 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.allay.death master @s ^ ^1 ^1 0.3 1.8 0.3
    execute if score @s aj.lance_biim_1.frame matches 11..20 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.allay.death master @s ^ ^1 ^1 0.3 1.9 0.3
    execute if score @s aj.lance_biim_1.frame matches 11..20 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.allay.death master @s ^ ^1 ^1 0.3 2 0.3
    execute if score @s aj.lance_biim_1.frame matches 2..25 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.3 2 0.3
    execute if score @s aj.lance_biim_1.frame matches 2..25 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.3 1.8 0.3
    execute if score @s aj.lance_biim_1.frame matches 2..10 run playsound entity.player.breath master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 1.9
    execute if score @s aj.lance_biim_1.frame matches 11..20 run playsound entity.player.breath master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 2
    execute if score @s aj.lance_biim_1.frame matches 37 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_biim_1.frame matches 37 run particle block{block_state:"minecraft:sand"} ^ ^ ^3 2 0.1 2 0 30
    execute if score @s aj.lance_biim_1.frame matches 33..48 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound entity.warden.sonic_charge master @s ^ ^1 ^5 1 1.7 0.4
    execute if score @s aj.lance_biim_1.frame matches 49..55 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound entity.warden.sonic_charge master @s ^ ^1 ^5 1 2 0.4

# 演出
    execute if score @s aj.lance_biim_1.frame matches 2..63 run function mhdp_monster_valk:core/tick/animation/event/lance_biim_1/particle_1
    execute if score @s aj.lance_biim_1.frame matches 43..63 run function mhdp_monster_valk:core/tick/animation/event/lance_biim_1/particle_2
    execute if score @s aj.lance_biim_1.frame matches 6 run function mhdp_monster_valk:core/tick/animation/event/lance_biim_1/thunder_start
    execute if score @s aj.lance_biim_1.frame matches 6..63 run function mhdp_monster_valk:core/tick/animation/event/lance_biim_1/thunder_tick
    execute if score @s aj.lance_biim_2.frame matches 27 as @e[type=text_display,tag=Mns.Shot.Valk,tag=Mns.Shot.Valk.Vfx.Thunder,tag=Mns.Shot.Valk.Vfx.RedFlash.Long] run data modify entity @s transformation.scale set value [3.5f,3.5f,3.5f]
        # 召喚
        execute if score @s aj.lance_biim_1.frame matches 43 run scoreboard players set #mhdp_temp_valk_flash_scale MhdpCore 200
        execute if score @s aj.lance_biim_1.frame matches 43 positioned ^ ^2 ^8 run summon text_display ~ ~ ~ {Tags:["Mns.Shot.Valk","Mns.Shot.Valk.Vfx.Jet","Mns.Shot.Valk.Vfx.RedFlash.Long"],view_range:1000f,default_background:0b,brightness:{sky:15,block:15},text:'{"text":"0","font":"vfx/valstrax"}',transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[2f,2f,2f]},background:16777215,teleport_duration:1,billboard:"center",start_interpolation:-1,interpolation_duration:4,text_opacity:255,alignment:"center"}
        execute if score @s aj.lance_biim_1.frame matches 44..63 run function mhdp_monster_valk:core/tick/animation/event/lance_biim_1/flash

# モデル演出
    execute if score @s aj.lance_biim_1.frame matches 2 run function mhdp_monster_valk:core/util/models/ignite_start

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.lance_biim_1.frame matches 64 run function mhdp_monster_valk:core/tick/animation/event/lance_biim_1/end
