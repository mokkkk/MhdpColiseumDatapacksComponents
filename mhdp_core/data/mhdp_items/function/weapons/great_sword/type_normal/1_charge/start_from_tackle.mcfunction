#> mhdp_items:weapons/great_sword/type_normal/1_charge/start_from_tackle
#
# 溜め 開始
#
# @within function mhdp_items:weapons/great_sword/type_normal/main

# 前処理
    function mhdp_items:weapons/great_sword/util/before_attack

# タグ付与
    tag @s add Wpn.Gs.Normal.Charge
    tag @s remove Ply.Weapon.NoOpe

# その他初期化
    scoreboard players set @s Wpn.Gs.ChargeTimer 0

# execute if score @s Wpn.Gs.ChargeSlashCount matches 0 run say 大剣・溜め
# execute if score @s Wpn.Gs.ChargeSlashCount matches 1 run say 大剣・強溜め
# execute if score @s Wpn.Gs.ChargeSlashCount matches 2.. run say 大剣・真溜め