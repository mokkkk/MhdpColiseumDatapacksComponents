#> mhdp_items:weapons/great_sword/type_normal/general
#
# 共通処理
#
# @within function mhdp_items:weapons/great_sword/type_normal/main

# 立ち状態の判別
    execute if entity @s[tag=!Wpn.Gs.Normal.Charge,tag=!Wpn.Gs.Normal.Tackle,tag=!Wpn.Gs.Normal.ChargeSlash,tag=!Wpn.Gs.Normal.Guard] run tag @s add Ply.Weapon.NoOpe
