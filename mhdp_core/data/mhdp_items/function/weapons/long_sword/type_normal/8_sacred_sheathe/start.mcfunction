#> mhdp_items:weapons/long_sword/type_normal/20_special_sheathe/start
#
# 威合 開始
#
# @within function mhdp_items:weapons/long_sword/type_normal/1_charge/change_to_chargeattack

# 前処理
    function mhdp_items:weapons/long_sword/util/before_attack

# タグ付与
    tag @s add Wpn.Ls.Normal.SacredSheathe
    tag @s remove Ply.Weapon.NoOpe
