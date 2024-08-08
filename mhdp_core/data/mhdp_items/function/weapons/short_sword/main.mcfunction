#> mhdp_items:weapons/short_sword/main
#
# 片手剣のメイン処理
#
# @within function mhdp_items:/**

# 地の型
    execute if entity @s[tag=!Ply.Weapon.Type.Tech] run function mhdp_items:weapons/short_sword/type_normal/main

# 天の型
    execute if entity @s[tag=Ply.Weapon.Type.Tech] run function mhdp_items:weapons/short_sword/type_tec/main
