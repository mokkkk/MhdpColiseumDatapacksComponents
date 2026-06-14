#> mhdp_items:weapons/long_sword/type_normal/2_normal_2/start
#
# 突き 開始
#
# @within function mhdp_items:weapons/long_sword/type_normal/1_charge/change_to_chargeattack

# 前処理
    function mhdp_items:weapons/long_sword/util/before_attack

# タグ付与
    tag @s add Wpn.Ls.Normal.Normal.2
    tag @s remove Ply.Weapon.NoOpe
