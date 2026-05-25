#> mhdp_items:weapons/long_sword/type_tec/12_red_normal_1/start
#
# 赤刃斬り1 開始
#
# @within function mhdp_items:weapons/long_sword/type_tec/1_charge/change_to_chargeattack

# 前処理
    function mhdp_items:weapons/long_sword/util/before_attack

# タグ付与
    tag @s add Wpn.Ls.Tec.RedNormal.1
    tag @s remove Ply.Weapon.NoOpe
