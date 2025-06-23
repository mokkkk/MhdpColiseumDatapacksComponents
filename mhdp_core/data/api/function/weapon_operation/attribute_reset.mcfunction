#> api:weapon_operation/attribute_reset
#
# attributeによる移動性能低下を解除する

# 移動速度低下
    attribute @s movement_speed modifier remove mhdp_core:weapon_movement_speed

# ジャンプ力低下
    attribute @s jump_strength modifier remove mhdp_core:weapon_jump_strength
