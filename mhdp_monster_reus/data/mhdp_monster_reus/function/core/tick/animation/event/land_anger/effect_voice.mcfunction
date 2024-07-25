#> mhdp_monster_ranposu:core/tick/animation/event/down/effect_stun
#
# アニメーションイベントハンドラ ダウン
#
# @within function mhdp_monster_ranposu:core/tick/animation/event/down/main

# スタンパーティクル
    $execute positioned ^$(posx) ^$(posy) ^$(posz) run particle flash ~ ~ ~ 0.3 0.1 0.3 0.3 1
