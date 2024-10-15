#> mhdp_monster_valk:core/tick/animation/event/lance_flytackle_repeat/m.particle
#
# アニメーションイベントハンドラ 滑空突進折り返し
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# ヒット確認
    $execute positioned ^$(posx) ^$(posy) ^$(posz) run particle dust{color:[1.000,0.000,0.152],scale:1} ^ ^ ^-3 0.5 0.5 0.5 0.15 1
    $execute positioned ^$(posx) ^$(posy) ^$(posz) run particle crimson_spore ^ ^ ^-3 0.3 0.3 0.3 1 10
