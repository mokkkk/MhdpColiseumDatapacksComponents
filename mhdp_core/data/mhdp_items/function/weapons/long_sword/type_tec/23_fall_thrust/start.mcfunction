#> mhdp_items:weapons/long_sword/type_tec/23_fall_thrust/start
#
# 落下突き 開始
#
# @within function mhdp_items:weapons/long_sword/type_tec/1_charge/change_to_chargeattack

# 前処理
    function mhdp_items:weapons/long_sword/util/before_attack

# タグ付与
    tag @s add Wpn.Ls.Tec.FallThrust
    tag @s remove Ply.Weapon.NoOpe
