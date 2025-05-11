#> mhdp_items:weapons/bow/type_normal/2_shot/start
#
# 射撃 開始
#
# @within function mhdp_items:weapons/bow/type_normal/1_charge/change_to_chargeattack

# タグ付与
    tag @s add Wpn.Bw.Normal.Shot

# attribute設定
    attribute @s jump_strength modifier remove mhdp_core:weapon_jump_strength
    attribute @s jump_strength modifier add mhdp_core:weapon_jump_strength -1 add_value

# say 武器操作：弓 射撃