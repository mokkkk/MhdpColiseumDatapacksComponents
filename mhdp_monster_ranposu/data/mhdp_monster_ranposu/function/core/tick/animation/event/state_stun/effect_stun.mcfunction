#> mhdp_monster_ranposu:core/tick/animation/event/state_stun/effect_stun
#
# アニメーションイベントハンドラ スタン
#
# @within function mhdp_monster_ranposu:core/tick/animation/event/state_stun/main

# スタンパーティクル
    $execute positioned ^$(posx) ^$(posy) ^$(posz) run particle crit ~ ~1 ~ 0.3 0.1 0.3 0.3 1
