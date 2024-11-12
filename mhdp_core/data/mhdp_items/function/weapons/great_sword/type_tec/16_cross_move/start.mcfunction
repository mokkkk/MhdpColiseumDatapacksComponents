#> mhdp_items:weapons/great_sword/type_tec/16_cross_move/start
#
# 十字斬り・移動 開始
#
# @within function mhdp_items:weapons/great_sword/type_tec/1_charge/change_to_chargeattack

# タグ付与
    tag @s add Wpn.Gs.Tec.CrossMove

# attribute設定
    attribute @s generic.jump_strength modifier remove mhdp_core:weapon_jump_strength
    attribute @s generic.jump_strength modifier add mhdp_core:weapon_jump_strength -1 add_value

# say 武器操作：大剣・十字斬り・移動