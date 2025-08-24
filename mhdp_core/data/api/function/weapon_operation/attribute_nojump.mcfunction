#> api:weapon_operation/attribute_nojump
#
# attributeを操作し、移動を禁止する

# ジャンプ禁止
    attribute @s jump_strength modifier remove mhdp_core:weapon_jump_strength
    attribute @s jump_strength modifier add mhdp_core:weapon_jump_strength -1.0 add_value
