#> api:weapon_operation/attribute_moveslow
#
# attributeを操作し、移動速度を低下する

# 移動速度低下
    attribute @s movement_speed modifier remove mhdp_core:weapon_movement_speed
    attribute @s movement_speed modifier add mhdp_core:weapon_movement_speed -0.06 add_value

# ジャンプ禁止
    attribute @s jump_strength modifier remove mhdp_core:weapon_jump_strength
    attribute @s jump_strength modifier add mhdp_core:weapon_jump_strength -1.0 add_value