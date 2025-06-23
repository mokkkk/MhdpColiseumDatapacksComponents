#> api:weapon_operation/attribute_movestop
#
# attributeを操作し、移動を禁止する

# 移動停止
    attribute @s movement_speed modifier remove mhdp_core:weapon_movement_speed
    attribute @s movement_speed modifier add mhdp_core:weapon_movement_speed -0.2 add_value

# ジャンプ禁止
    attribute @s jump_strength modifier remove mhdp_core:weapon_jump_strength
    attribute @s jump_strength modifier add mhdp_core:weapon_jump_strength -1.0 add_value
