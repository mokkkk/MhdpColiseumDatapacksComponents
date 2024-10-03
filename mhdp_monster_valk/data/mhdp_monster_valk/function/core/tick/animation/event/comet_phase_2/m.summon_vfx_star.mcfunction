#> mhdp_monster_valk:core/tick/animation/event/comet_phase_1/m.summon_vfx_star
#
# アニメーションイベントハンドラ 彗星・離陸
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 召喚
    $execute positioned ^$(posx) ^$(posy) ^$(posz) run summon text_display ~ ~ ~ {Tags:["Mns.Shot.Valk","Mns.Shot.Valk.Vfx.Star"],view_range:1000f,default_background:0b,brightness:{sky:15,block:15},text:'{"text":"0","font":"vfx/valstrax"}',transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0f,0f,0f]},background:16777215,see_through:1b,teleport_duration:1,billboard:"center",start_interpolation:-1,interpolation_duration:8,alignment:"center"}
