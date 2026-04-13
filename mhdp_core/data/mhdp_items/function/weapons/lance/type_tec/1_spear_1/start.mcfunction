#> mhdp_items:weapons/lance/type_tec/1_spear_1/start
#
# 突き1 開始
#
# @within function mhdp_items:weapons/lance/type_tec/1_charge/change_to_chargeattack

# 前処理
    function mhdp_items:weapons/lance/util/before_attack

# タグ付与
    tag @s add Wpn.Lc.Tec.Spear.1
    tag @s remove Ply.Weapon.NoOpe
