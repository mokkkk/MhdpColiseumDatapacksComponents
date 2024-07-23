#> mhdp_monster_reus:core/tick/animation/event/land_chargebite/head_effect
#
# アニメーションイベントハンドラ チャージ嚙みつき
#
# @within function mhdp_monster_reus:core/tick/animation/event/land_chargebite/main

# パーティクル
    $execute positioned ^$(posx) ^$(posy) ^$(posz) run particle flame ~ ~ ~ 0.1 0.1 0.1 0.1 2
    $execute positioned ^$(posx) ^$(posy) ^$(posz) run particle smoke ~ ~ ~ 0.1 0.1 0.1 0.1 1
