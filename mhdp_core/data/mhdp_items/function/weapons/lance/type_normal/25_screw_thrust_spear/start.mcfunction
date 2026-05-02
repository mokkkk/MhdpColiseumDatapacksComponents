#> mhdp_items:weapons/lance/type_normal/12_counter_spear/start
#
# カウンター突き 開始
#
# @within function mhdp_items:weapons/lance/type_normal/1_charge/change_to_chargeattack

# 前処理
    function mhdp_items:weapons/lance/util/before_attack

# タグ付与
    tag @s add Wpn.Lc.Normal.ScrewSpear
    tag @s remove Ply.Weapon.NoOpe
    tag @s remove Ply.Weapon.StaminaNotRegen
