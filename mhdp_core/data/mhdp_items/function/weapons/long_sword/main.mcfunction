#> mhdp_items:weapons/long_sword/main
#
# 太刀のメイン処理
#
# @within function mhdp_items:/**

# tick
    function mhdp_items:weapons/long_sword/util/tick

# 地の型
    execute if entity @s[tag=!Ply.Weapon.Type.Tech] run function mhdp_items:weapons/long_sword/type_normal/main

# 天の型
    execute if entity @s[tag=Ply.Weapon.Type.Tech] run function mhdp_items:weapons/long_sword/type_tec/main
