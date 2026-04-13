#> mhdp_items:weapons/lance/main
#
# ランスのメイン処理
#
# @within function mhdp_items:/**

# 地の型
    # execute if entity @s[tag=!Ply.Weapon.Type.Tech] run function mhdp_items:weapons/lance/type_normal/main

# 天の型
    execute if entity @s[tag=Ply.Weapon.Type.Tech] run function mhdp_items:weapons/lance/type_tec/main
