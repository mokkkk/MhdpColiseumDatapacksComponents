#> mhdp_monster_dino:core/tick/animation/event/anger/m.particle_head
#
# アニメーションイベントハンドラ 咆哮
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# ヒット確認
    $execute positioned ^$(posx) ^$(posy) ^$(posz) run particle flash ^ ^-0.5 ^0.7 0 0 0 0 1 force
