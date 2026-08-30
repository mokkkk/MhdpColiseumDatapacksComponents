#> mhdp_monster_valk:core/tick/animation/event/lance_biim_2/attack_beam_air_loop
#
# アニメーションイベントハンドラ 龍閃
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# ロード圏外の場合実行しない
    execute unless loaded ~ ~ ~ run return 0

# ヒット確認
    # 対プレイヤー
        execute positioned ^ ^1 ^ as @a[tag=Ply.State.EnableDamage,distance=..4.5] run tag @s add Temp.Hit
        execute positioned ^ ^1 ^2.5 as @a[tag=Ply.State.EnableDamage,distance=..4.5] run tag @s add Temp.Hit
        execute as @a[tag=Temp.Hit] run function mhdp_core:player/damage/entity_to_player/main
        tag @a remove Temp.Hit

# 演出
    particle dust{color:[1.000,0.000,0.152],scale:3} ^ ^1 ^ 0.8 0.8 0.8 0.15 13
    # particle explosion ^ ^ ^ 1.8 1.8 1.8 0 6
    # summon text_display ^ ^ ^ {Tags:["Mns.Shot.Valk","Mns.Shot.Valk.Vfx.Bomb"],default_background:0b,brightness:{sky:15,block:15},text:{"text":"0","font":"vfx/valstrax"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[7f,7f,7f]},background:16777215,text_opacity:255,interpolation_duration:1,teleport_duration:2,billboard:"center",alignment:"left"}
    summon text_display ^ ^ ^ {Tags:["Mns.Shot.Valk","Mns.Shot.Valk.Vfx.RedFlash"],default_background:0b,brightness:{sky:15,block:15},text:{"text":"0","font":"vfx/valstrax"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[8f,8f,8f]},background:16777215,text_opacity:255,interpolation_duration:1,teleport_duration:2,text_opacity:255,billboard:"center",alignment:"left"}
    particle dust_pillar{block_state:"minecraft:sand"} ^ ^-1 ^ 2 0.1 2 0.3 10 force

# 再帰
    scoreboard players remove #mhdp_temp_valk_beam_count MhdpCore 1
    execute if score #mhdp_temp_valk_beam_count MhdpCore matches 1.. if block ^ ^ ^5 #mhdp_core:no_collision positioned ^ ^ ^5 run function mhdp_monster_valk:core/tick/animation/event/lance_biim_2/attack_beam_finish_loop
