#> mhdp_items:weapons/great_sword/type_tec/15_cross/start
#
# 溜め斬り 開始
#
# @within function mhdp_items:weapons/great_sword/type_tec/1_charge/change_to_chargeattack

# タグ付与
    tag @s add Wpn.Gs.Tec.Cross

# attribute設定
    attribute @s generic.jump_strength modifier remove mhdp_core:weapon_jump_strength
    attribute @s generic.jump_strength modifier add mhdp_core:weapon_jump_strength -1 add_value

say 大剣・十字斬り