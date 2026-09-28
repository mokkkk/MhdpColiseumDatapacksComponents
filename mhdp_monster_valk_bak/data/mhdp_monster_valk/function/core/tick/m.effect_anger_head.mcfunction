#> mhdp_monster_reus:core/tick/effect_anger_head
#
# tick処理
#
# @within function mhdp_monster_valk:core/tick/tick_main

# 怒りパーティクル
    $execute positioned ^$(posx) ^$(posy) ^$(posz) run particle dust{color:[1.000,0.112,0.112],scale:0.6} ^ ^ ^0.3 0.35 0.35 0.35 0.15 1
