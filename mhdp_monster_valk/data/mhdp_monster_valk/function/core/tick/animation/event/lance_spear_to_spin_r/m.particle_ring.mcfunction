#> mhdp_monster_valk:core/tick/animation/event/lance_spear_to_spin_r/m.attack
#
# アニメーションイベントハンドラ 2連突き
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# ヒット確認
    $execute positioned ^$(posx) ^$(posy) ^$(posz) positioned ^ ^ ^-2 run function mhdp_monster_valk:core/tick/animation/event/lance_spear_r_to_l/particle_ring
    $execute positioned ^$(posx) ^$(posy) ^$(posz) positioned ^ ^ ^-4 run function mhdp_monster_valk:core/tick/animation/event/lance_spear_r_to_l/particle_ring
