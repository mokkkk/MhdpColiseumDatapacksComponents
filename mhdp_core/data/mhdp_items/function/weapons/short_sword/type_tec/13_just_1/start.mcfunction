#> mhdp_items:weapons/short_sword/type_tec/13_just_1/start
#
# 飛び込み斬り 開始
#
# @within function mhdp_items:weapons/short_sword/type_tec/1_charge/change_to_chargeattack

# タグ付与
    tag @s add Wpn.Ss.Tec.Just.1

# attribute設定
    attribute @s jump_strength modifier remove mhdp_core:weapon_jump_strength
    attribute @s jump_strength modifier add mhdp_core:weapon_jump_strength -1 add_value

# 準備
    tp @s @s

# say 武器操作：片手剣 飛び込み斬り