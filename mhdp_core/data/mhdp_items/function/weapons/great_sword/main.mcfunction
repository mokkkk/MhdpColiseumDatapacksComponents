#> mhdp_items:weapons/great_sword/main
#
# 大剣のメイン処理
#
# @within function mhdp_items:/**

# 地の型
    execute if entity @s[tag=!Ply.Weapon.Type.Tech] run function mhdp_items:weapons/great_sword/type_normal/main

# 天の型
    execute if entity @s[tag=Ply.Weapon.Type.Tech] run function mhdp_items:weapons/great_sword/type_tec/main
