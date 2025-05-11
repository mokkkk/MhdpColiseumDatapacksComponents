#> mhdp_items:weapons/short_sword/type_tec/22_fall/start
#
# フォールバッシュ 開始
#
# @within function mhdp_items:weapons/short_sword/type_tec/22_fall/change_to_chargeattack

# タグ付与
    tag @s add Wpn.Ss.Tec.Fall

# attribute設定
    attribute @s jump_strength modifier remove mhdp_core:weapon_jump_strength
    attribute @s jump_strength modifier add mhdp_core:weapon_jump_strength -1 add_value

# say 武器操作：片手剣 フォールバッシュ