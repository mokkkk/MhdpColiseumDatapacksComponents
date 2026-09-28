#> mhdp_monster_valk:core/tick/animation/event/lance_spear_to_spin_r/m.attack
#
# アニメーションイベントハンドラ 2連突き
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# ヒット確認
    $execute positioned ^$(posx) ^$(posy) ^$(posz) run particle cloud ^ ^ ^-3 0.1 0.1 0.1 0.05 5
