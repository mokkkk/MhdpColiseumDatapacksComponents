#> mhdp_monster_valk:core/tick/animation/event/shoot_vertical_r/m.attack
#
# アニメーションイベントハンドラ 翼叩きつけ
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 演出
    $execute positioned ^$(posx) ^$(posy) ^$(posz) run particle dust{color:[1.000,0.412,0.412],scale:4} ^ ^1 ^ 0.5 0.5 0.5 0.15 3
    $execute positioned ^$(posx) ^$(posy) ^$(posz) run particle dust{color:[1.000,0.412,0.412],scale:4} ^ ^1 ^2 0.5 0.5 0.5 0.15 3
