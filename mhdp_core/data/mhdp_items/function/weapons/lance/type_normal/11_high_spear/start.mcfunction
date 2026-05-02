#> mhdp_items:weapons/lance/type_normal/11_high_spear/start
#
# 強突き 開始
#
# @within function mhdp_items:weapons/lance/type_tec/1_charge/change_to_chargeattack

# 前処理
    function mhdp_items:weapons/lance/util/before_attack

# タグ付与
    tag @s add Wpn.Lc.Normal.HighSpear
    tag @s remove Ply.Weapon.NoOpe
    tag @s remove Ply.Weapon.Guard
    tag @s remove Ply.Weapon.StaminaNotRegen
