#> mhdp_monster_valk:core/tick/m.effect_anger_wing
#
# tick処理
#
# @within function mhdp_monster_valk:core/tick/tick_main

# 怒りパーティクル
    $execute positioned ^$(posx) ^$(posy) ^$(posz) run particle dust{color:[1.000,0.112,0.312],scale:1} ^ ^ ^ 0.5 0.5 0.5 0.15 1
    $execute positioned ^$(posx) ^$(posy) ^$(posz) run particle crimson_spore ^ ^ ^ 0.3 0.3 0.3 1 2
