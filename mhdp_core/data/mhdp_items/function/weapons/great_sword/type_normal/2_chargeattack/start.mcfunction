#> mhdp_items:weapons/great_sword/type_normal/2_chargeattack/start
#
# 溜め斬り 開始
#
# @within function mhdp_items:weapons/great_sword/type_normal/1_charge/change_to_chargeattack

# 前処理
    function mhdp_items:weapons/great_sword/util/before_attack

# タグ付与
    tag @s add Wpn.Gs.Normal.ChargeSlash
    tag @s remove Ply.Weapon.NoOpe

# say 大剣・溜め斬り