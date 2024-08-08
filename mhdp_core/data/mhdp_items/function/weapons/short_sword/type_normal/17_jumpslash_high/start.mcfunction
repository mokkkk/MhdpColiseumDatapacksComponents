#> mhdp_items:weapons/short_sword/type_normal/17_jumpslash_high/start
#
# 駆け上がり斬り 開始
#
# @within function mhdp_items:weapons/short_sword/type_normal/1_charge/change_to_chargeattack

# タグ付与
    tag @s add Wpn.Ss.Normal.JumpSlash.High

# attribute設定
    attribute @s generic.jump_strength modifier remove mhdp_core:weapon_jump_strength
    attribute @s generic.jump_strength modifier add mhdp_core:weapon_jump_strength -1 add_value

say 片手剣 駆け上がり斬り