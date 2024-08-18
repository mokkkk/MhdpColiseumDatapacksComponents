#> mhdp_monster_dino:core/tick/animation/event/down_right/effect_stun
#
# アニメーションイベントハンドラ ダウン
#
# @within function mhdp_monster_dino:core/tick/animation/event/down_right/main

# スタンパーティクル
    $execute positioned ^$(posx) ^$(posy) ^$(posz) run particle crit ~ ~1 ~ 0.3 0.1 0.3 0.3 1
