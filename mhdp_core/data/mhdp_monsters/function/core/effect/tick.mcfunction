#> mhdp_monsters:core/effect/tick
#
# 汎用処理 演出
#
# @within function mhdp_monsters:/**

# 地割れ
    execute if entity @s[tag=Effect.CrackGround] run function mhdp_monsters:core/effect/crack_ground/tick
