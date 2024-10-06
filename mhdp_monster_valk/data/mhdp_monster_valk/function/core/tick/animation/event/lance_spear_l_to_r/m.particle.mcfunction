#> mhdp_monster_valk:core/tick/animation/event/lance_upper_l/m.attack
#
# アニメーションイベントハンドラ 振りむき翼槍叩きつけ
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# ヒット確認
    $execute positioned ^$(posx) ^$(posy) ^$(posz) run particle dust{color:[1.000,0.112,0.312],scale:4} ^ ^2 ^ 0.5 0.5 0.5 0.15 3
    $execute positioned ^$(posx) ^$(posy) ^$(posz) run particle cloud ^ ^ ^2 0.8 0.8 0.8 0.15 8
