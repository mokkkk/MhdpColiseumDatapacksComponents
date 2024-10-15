#> mhdp_monster_valk:core/tick/animation/event/lance_flytackle_repeat/m.particle_launch
#
# アニメーションイベントハンドラ 滑空突進折り返し
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# ヒット確認
    $execute positioned ^$(posx) ^$(posy) ^$(posz) run particle flash ~ ~ ~ 0 0 0 0 1
    $execute positioned ^$(posx) ^$(posy) ^$(posz) run particle dust{color:[1.000,0.000,0.152],scale:3} ^ ^ ^-3 1 1 1 0.15 10
