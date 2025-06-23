#> mhdp_items:weapons/great_sword/type_tec/2_chargeattack/start
#
# 溜め斬り 開始
#
# @within function mhdp_items:weapons/great_sword/type_tec/1_charge/change_to_chargeattack

# 前処理
    function mhdp_items:weapons/great_sword/util/before_attack

# タグ付与
    tag @s add Wpn.Gs.Tec.ChargeSlash
    tag @s remove Ply.Weapon.NoOpe

# execute if score @s Wpn.Gs.ChargeSlashCount matches 0 run say 大剣・溜め斬り
# execute if score @s Wpn.Gs.ChargeSlashCount matches 1 run say 大剣・強溜め斬り
# execute if score @s Wpn.Gs.ChargeSlashCount matches 2.. run say 大剣・真溜め斬り