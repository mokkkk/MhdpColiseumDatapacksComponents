#> mhdp_items:weapons/long_sword/type_tec/16_red_spin/start
#
# 赤刃旋転斬 開始
#
# @within function mhdp_items:weapons/long_sword/type_tec/1_charge/change_to_chargeattack

# 前処理
    function mhdp_items:weapons/long_sword/util/before_attack

# 練気確認
    tag @s add Wpn.Ls.Tec.RedSpin

# タグ付与
    tag @s remove Ply.Weapon.NoOpe
