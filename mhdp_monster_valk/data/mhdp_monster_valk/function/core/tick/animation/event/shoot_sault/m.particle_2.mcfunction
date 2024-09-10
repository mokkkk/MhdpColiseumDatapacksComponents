#> mhdp_monster_valk:core/tick/animation/event/shoot_bomb_forward/m.particle_2
#
# アニメーションイベントハンドラ 側面爆発
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# ヒット確認
    $execute positioned ^$(posx) ^$(posy) ^$(posz) run particle dust{color:[100000000.000,0.8,0.8],scale:2} ^ ^ ^ 0.5 0.5 0.5 0.15 1
