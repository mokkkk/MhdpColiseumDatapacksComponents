#> mhdp_items:weapons/short_sword/type_tec/10_spin/start
#
# 回転斬り 開始
#
# @within function mhdp_items:weapons/short_sword/type_tec/1_charge/change_to_chargeattack

# タグ付与
    tag @s add Wpn.Ss.Tec.Spin

# attribute設定
    attribute @s jump_strength modifier remove mhdp_core:weapon_jump_strength
    attribute @s jump_strength modifier add mhdp_core:weapon_jump_strength -1 add_value

# say 武器操作：片手剣 回転斬り