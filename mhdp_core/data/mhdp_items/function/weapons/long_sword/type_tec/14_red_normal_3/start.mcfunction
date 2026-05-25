#> mhdp_items:weapons/long_sword/type_tec/14_red_normal_3/start
#
# 赤刃斬り 開始
#
# @within function mhdp_items:weapons/long_sword/type_tec/1_charge/change_to_chargeattack

# 前処理
    function mhdp_items:weapons/long_sword/util/before_attack

# タグ付与
    tag @s add Wpn.Ls.Tec.Normal.3
    tag @s remove Ply.Weapon.NoOpe
