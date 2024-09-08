#> mhdp_monster_valk:core/tick/animation/event/comet_phase_1/m.summon_vfx
#
# アニメーションイベントハンドラ 彗星・離陸
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 召喚
    $execute positioned ^$(posx) ^$(posy) ^$(posz) run summon text_display ~ ~ ~ {Tags:["Mns.Shot.Valk","Mns.Shot.Valk.Vfx.Comet","Start"],view_range:60f,default_background:0b,brightness:{sky:15,block:15},text:'{"text":"0","font":"vfx/valstrax"}',transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[128f,128f,1f]},background:16777215,see_through:1b,text_opacity:255,billboard:"center"}
    execute as @n[type=text_display,tag=Mns.Shot.Valk.Vfx.Comet,tag=Start] positioned as @s run tp @s ~ ~ ~ ~180 ~45
