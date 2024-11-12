#> mhdp_items:weapons/great_sword/type_normal/2_chargeattack/start
#
# 溜め斬り 開始
#
# @within function mhdp_items:weapons/great_sword/type_normal/1_charge/change_to_chargeattack

# タグ付与
    tag @s add Wpn.Gs.Normal.ChargeSlash

# attribute設定
    attribute @s generic.jump_strength modifier remove mhdp_core:weapon_jump_strength
    attribute @s generic.jump_strength modifier add mhdp_core:weapon_jump_strength -1 add_value

# say 武器操作：大剣・溜め斬り