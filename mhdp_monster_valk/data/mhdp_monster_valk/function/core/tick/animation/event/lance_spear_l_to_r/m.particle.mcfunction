#> mhdp_monster_valk:core/tick/animation/event/lance_spear_l_to_r/m.attack
#
# アニメーションイベントハンドラ 2連突き
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# ヒット確認
    $execute positioned ^$(posx) ^$(posy) ^$(posz) run particle dust{color:[1.000,0.412,0.412],scale:4} ^ ^2 ^ 0.5 0.5 0.5 0.15 3
    $execute positioned ^$(posx) ^$(posy) ^$(posz) run particle cloud ^ ^ ^2 0.8 0.8 0.8 0.15 8
