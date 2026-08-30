#> mhdp_monster_valk:core/tick/animation/event/lance_biim_1/m.thunder_tick
#
# アニメーションイベントハンドラ 龍閃
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 演出移動
    $execute as @n[type=text_display,tag=Mns.Shot.Valk,tag=Mns.Shot.Valk.Vfx.Thunder,tag=Mns.Shot.Valk.Vfx.RedFlash.Long,tag=!Temp.IsTp] positioned ^$(posx) ^$(posy) ^$(posz) run tp @s ^ ^-0.2 ^0.3
    tag @n[type=text_display,tag=Mns.Shot.Valk,tag=Mns.Shot.Valk.Vfx.Thunder,tag=Mns.Shot.Valk.Vfx.RedFlash.Long,tag=!Temp.IsTp] add Temp.IsTp
