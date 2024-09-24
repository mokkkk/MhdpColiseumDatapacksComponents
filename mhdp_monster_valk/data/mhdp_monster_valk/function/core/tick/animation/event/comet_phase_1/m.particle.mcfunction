#> mhdp_monster_valk:core/tick/animation/event/comet_phase_1/m.particle
#
# アニメーションイベントハンドラ 滑空突進開始
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# ヒット確認
    $execute positioned ^$(posx) ^$(posy) ^$(posz) run particle dust{color:[1.000,0.412,0.412],scale:1} ^ ^ ^-3 0.5 0.5 0.5 0.15 1
    $execute positioned ^$(posx) ^$(posy) ^$(posz) run particle crimson_spore ^ ^ ^-3 0.3 0.3 0.3 1 10
