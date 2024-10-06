#> mhdp_monster_valk:core/tick/animation/event/lance_spear_r_to_l/m.attack
#
# アニメーションイベントハンドラ 2連突き
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# ヒット確認
    $execute positioned ^$(posx) ^$(posy) ^$(posz) run particle large_smoke ^ ^ ^-3 0.5 0.5 0.5 0.3 15
