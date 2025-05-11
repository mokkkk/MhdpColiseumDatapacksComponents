#> mhdp_items:weapons/short_sword/type_tec/14_just_2/start
#
# ジャストラッシュ2 開始
#
# @within function mhdp_items:weapons/short_sword/type_tec/1_charge/change_to_chargeattack

# タグ付与
    tag @s add Wpn.Ss.Tec.Just.2

# attribute設定
    attribute @s jump_strength modifier remove mhdp_core:weapon_jump_strength
    attribute @s jump_strength modifier add mhdp_core:weapon_jump_strength -1 add_value

# say 武器操作：片手剣 ジャストラッシュ2