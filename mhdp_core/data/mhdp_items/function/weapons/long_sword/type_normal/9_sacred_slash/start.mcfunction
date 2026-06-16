#> mhdp_items:weapons/long_sword/type_normal/9_sacred_slash/start
#
# 踏み込み気刃斬り 開始
#
# @within function mhdp_items:weapons/long_sword/type_normal/1_charge/change_to_chargeattack

# 前処理
    function mhdp_items:weapons/long_sword/util/before_attack

# 練気確認
    tag @s add Wpn.Ls.Normal.SacredSlash

# タグ付与
    tag @s remove Ply.Weapon.NoOpe
