#> mhdp_monster_valk:core/tick/animation/event/lance_biim_2/m.tp_vfx_beam
#
# アニメーションイベントハンドラ 龍閃
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 演出移動
    $execute positioned ^$(posx) ^$(posy) ^$(posz) run tp @n[type=text_display,tag=Mns.Shot.Valk.Vfx.Beam] ~ ~ ~ ~ 0
