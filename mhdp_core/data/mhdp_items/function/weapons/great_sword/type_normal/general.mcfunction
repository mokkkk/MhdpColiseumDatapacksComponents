#> mhdp_items:weapons/great_sword/type_normal/general
#
# 共通処理
#
# @within function mhdp_items:weapons/great_sword/type_normal/main

# 立ち状態の判別
    execute if entity @s[tag=Ply.Weapon.Drawing,tag=!Wpn.Gs.Normal.Charge,tag=!Wpn.Gs.Normal.Tackle,tag=!Wpn.Gs.Normal.ChargeSlash,tag=!Wpn.Gs.Normal.Guard,tag=!Wpn.Gs.Normal.HuntingEdge,tag=!Wpn.Gs.Normal.Charge.Edge,tag=!Wpn.Gs.Normal.ChargeSlash.Edge] run tag @s add Ply.Weapon.NoOpe
