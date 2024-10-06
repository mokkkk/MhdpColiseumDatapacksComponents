#> mhdp_monster_valk:core/tick/animation/event/lance_charge_end/m.particle
#
# アニメーションイベントハンドラ 龍気吸引
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 演出
    $execute positioned ^$(posx) ^$(posy) ^$(posz) run particle dust{color:[1.000,0.112,0.312],scale:3} ^ ^ ^ 0.5 0.5 0.5 0.15 1
    $execute positioned ^$(posx) ^$(posy) ^$(posz) run particle crimson_spore ^ ^ ^ 0.3 0.3 0.3 1 10
    $execute positioned ^$(posx) ^$(posy) ^$(posz) run particle cloud ~ ~ ~ 0.1 0.1 0.1 0.1 1
