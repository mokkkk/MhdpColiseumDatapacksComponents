#> mhdp_monster_ranposu:core/tick/effect_anger
#
# tick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# 怒りパーティクル
    $execute positioned ^$(posx) ^$(posy) ^$(posz) run particle smoke ~ ~ ~ 0.1 0.1 0.1 0 1
