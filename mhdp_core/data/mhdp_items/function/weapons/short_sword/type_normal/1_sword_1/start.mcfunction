#> mhdp_items:weapons/short_sword/type_normal/1_sword_1/start
#
# 剣コンボ1 開始
#
# @within mhdp_items:weapons/short_sword/type_normal/main

# タグ付与
    tag @s add Wpn.Ss.Normal.Sword.1
    tag @s remove Ply.Weapon.NoOpe

# attribute設定
    attribute @s generic.jump_strength modifier remove mhdp_core:weapon_jump_strength
    attribute @s generic.jump_strength modifier add mhdp_core:weapon_jump_strength -1 add_value

# say 武器操作：片手剣 剣コンボ1