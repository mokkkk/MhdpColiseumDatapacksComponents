#> mhdp_monster_valk:core/tick/animation/event/lance_biim_1/thunder_start
#
# アニメーションイベントハンドラ 龍閃
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 雷エフェクト召喚
    execute positioned ^ ^2 ^8 run summon text_display ~ ~ ~ {Tags:["Mns.Shot.Valk","Mns.Shot.Valk.Vfx.Thunder","Mns.Shot.Valk.Vfx.RedFlash.Long","Start"],default_background:0b,brightness:{sky:15,block:15},text:'{"text":"0","font":"vfx/valstrax"}',transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[4f,4f,4f]},background:16777215,text_opacity:255,interpolation_duration:1,teleport_duration:0,text_opacity:255,billboard:"center",alignment:"left"}
    execute as @n[type=text_display,tag=Mns.Shot.Valk,tag=Mns.Shot.Valk.Vfx.Thunder,tag=Mns.Shot.Valk.Vfx.RedFlash.Long,tag=Start] store result score @s Mns.Shot.Timer run random value 0..2
    tag @n[type=text_display,tag=Mns.Shot.Valk,tag=Mns.Shot.Valk.Vfx.Thunder,tag=Mns.Shot.Valk.Vfx.RedFlash.Long,tag=Start] remove Start