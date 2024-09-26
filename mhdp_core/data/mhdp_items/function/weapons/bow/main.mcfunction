#> mhdp_items:weapons/bow/main
#
# 弓のメイン処理
#
# @within function mhdp_items:/**

# 地の型
    # execute if entity @s[tag=!Ply.Weapon.Type.Tech] run function mhdp_items:weapons/bow/type_normal/main

# 天の型
    execute if entity @s[tag=Ply.Weapon.Type.Tech] run function mhdp_items:weapons/bow/type_tec/main
