#> mhdp_monster_valk:core/tick/animation/event/lance_flytackle_end/m.particle
#
# アニメーションイベントハンドラ 滑空突進終了
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# ヒット確認
    $execute positioned ^$(posx) ^$(posy) ^$(posz) run particle dust{color:[1.000,0.212,0.212],scale:3.2} ^ ^ ^ 0.5 0.5 0.5 0.15 1
    $execute positioned ^$(posx) ^$(posy) ^$(posz) run particle dust{color:[1.000,0.369,0.369],scale:3.2} ^ ^ ^ 0.5 0.5 0.5 0.15 1
