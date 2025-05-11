#> mhdp_items:weapons/short_sword/type_tec/4_horizon_1/start
#
# 水平斬りコンボ1 開始
#
# @within function mhdp_items:weapons/short_sword/type_tec/1_charge/change_to_chargeattack

# タグ付与
    tag @s add Wpn.Ss.Normal.Sword.3

# attribute設定
    attribute @s jump_strength modifier remove mhdp_core:weapon_jump_strength
    attribute @s jump_strength modifier add mhdp_core:weapon_jump_strength -1 add_value

# say 武器操作：片手剣 剣コンボ3