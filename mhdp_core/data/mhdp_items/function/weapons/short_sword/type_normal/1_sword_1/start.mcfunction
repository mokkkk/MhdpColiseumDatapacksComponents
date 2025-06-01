#> mhdp_items:weapons/short_sword/type_normal/1_sword_1/start
#
# 剣コンボ1 開始
#
# @within mhdp_items:weapons/short_sword/type_normal/main

# 前処理
    function mhdp_items:weapons/short_sword/util/before_attack

# タグ付与
    tag @s add Wpn.Ss.Normal.Sword.1
    tag @s remove Ply.Weapon.NoOpe

# say 武器操作：片手剣 剣コンボ1