#> mhdp_monsters:core/util/tick/macro/m.poison_effect
# 
# 汎用処理 毒のエフェクト
#
# @within function mhdp_monsters:core/util/tick/start_damage_interval

# 毒パーティクル
    $execute positioned ^$(posx) ^$(posy) ^$(posz) run particle dust{color:[0.502,0.016,0.710],scale:1} ~ ~ ~ 0.5 0.5 0.5 0.15 10
