#> mhdp_monster_valk:core/tick/animation/event/lance_biim_2/m.tp_vfx_beam
#
# アニメーションイベントハンドラ 龍閃
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# AEC移動
    $execute positioned ^$(posx) ^$(posy) ^$(posz) run tp @n[type=area_effect_cloud,tag=Mns.BeamPos.Valk] ~ ~ ~ ~ 0
