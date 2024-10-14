#> mhdp_monster_valk:core/tick/animation/event/comet_phase_3/m.tp_vfx_jet
#
# アニメーションイベントハンドラ 彗星・滑空
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 召喚
    $execute positioned ^$(posx) ^$(posy) ^$(posz) run tp @n[type=text_display,tag=Mns.Shot.Valk.Vfx.Jet] ~ ~ ~ ~ 0
    $execute as @e[type=text_display,tag=Mns.Shot.Valk,tag=Mns.Shot.Valk.Vfx.Thunder,tag=Mns.Shot.Valk.Vfx.RedFlash.Long,tag=!Temp.IsTp] run tp @s ^$(posx) ^$(posy) ^$(posz)
