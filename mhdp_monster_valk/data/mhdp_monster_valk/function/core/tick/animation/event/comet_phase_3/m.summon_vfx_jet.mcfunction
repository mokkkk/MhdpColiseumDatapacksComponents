#> mhdp_monster_valk:core/tick/animation/event/comet_phase_3/m.summon_vfx_jet
#
# アニメーションイベントハンドラ 彗星・離陸
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 召喚
    $execute positioned ^$(posx) ^$(posy) ^$(posz) run summon text_display ~ ~ ~ {Tags:["Mns.Shot.Valk","Mns.Shot.Valk.Vfx.Jet"],view_range:1000f,default_background:0b,brightness:{sky:15,block:15},text:{"text":"0","font":"vfx/valstrax"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[20f,20f,20f]},background:16777215,teleport_duration:1,billboard:"center",start_interpolation:-1,interpolation_duration:4,text_opacity:255,alignment:"center"}
