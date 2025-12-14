#> mhdp_items:weapons/great_sword/type_tec/22_chargeattack_air/start
#
# 溜め斬り 開始
#
# @within function mhdp_items:weapons/great_sword/type_tec/22_chargeattack_air/change_to_chargeattack

# タグ付与
    tag @s add Wpn.Gs.Tec.ChargeSlash.Air

# attribute設定
    attribute @s jump_strength modifier remove mhdp_core:weapon_jump_strength
    attribute @s jump_strength modifier add mhdp_core:weapon_jump_strength -1 add_value

# say 武器操作：大剣・空中溜め斬り