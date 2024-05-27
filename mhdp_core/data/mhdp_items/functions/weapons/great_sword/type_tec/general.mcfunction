#> mhdp_items:weapons/great_sword/type_tec/general
#
# 共通処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# 立ち状態の判別
    execute if entity @s[tag=Ply.Weapon.Drawing,tag=!Wpn.Gs.Tec.Charge,tag=!Wpn.Gs.Tec.Tackle,tag=!Wpn.Gs.Tec.ChargeSlash,tag=!Wpn.Gs.Tec.Guard] run tag @s add Ply.Weapon.NoOpe
