#> mhdp_items:weapons/long_sword/type_tec/20_special_sheathe/start
#
# 特殊納刀 開始
#
# @within function mhdp_items:weapons/long_sword/type_tec/1_charge/change_to_chargeattack

# 前処理
    function mhdp_items:weapons/long_sword/util/before_attack

# タグ付与
    tag @s add Wpn.Ls.Tec.SpecialSheathe
    tag @s remove Ply.Weapon.NoOpe
