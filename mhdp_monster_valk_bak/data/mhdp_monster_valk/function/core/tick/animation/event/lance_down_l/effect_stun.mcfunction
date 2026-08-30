#> mhdp_monster_valk:core/tick/animation/event/lance_down_l/effect_stun
#
# アニメーションイベントハンドラ ダウン
#
# @within function mhdp_monster_valk:core/tick/animation/event/lance_down_l/main

# スタンパーティクル
    $execute positioned ^$(posx) ^$(posy) ^$(posz) run particle crit ~ ~1 ~ 0.3 0.1 0.3 0.3 1
