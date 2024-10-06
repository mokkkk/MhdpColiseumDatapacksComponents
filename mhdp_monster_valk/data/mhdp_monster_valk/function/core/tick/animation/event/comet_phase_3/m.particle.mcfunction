#> mhdp_monster_valk:core/tick/animation/event/comet_phase_1/m.particle_launch
#
# アニメーションイベントハンドラ 滑空突進開始
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# ヒット確認
    $execute positioned ^$(posx) ^$(posy) ^$(posz) run particle dust{color:[1.000,0.112,0.312],scale:4} ^ ^ ^5 3 3 3 0.15 30 force
    $execute positioned ^$(posx) ^$(posy) ^$(posz) run particle explosion ^ ^ ^5 3 3 3 0.1 10 force
