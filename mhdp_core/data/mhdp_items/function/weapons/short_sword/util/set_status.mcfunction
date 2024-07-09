#> mhdp_items:weapons/short_sword/util/set_status
#
# 武器のデフォルトステータス設定
#
# @within function mhdp_items:core/switch/macro/m.drawing

# ステータス設定
    attribute @s generic.attack_speed modifier remove mhdp_core:weapon_attack_speed
    attribute @s generic.attack_speed modifier add mhdp_core:weapon_attack_speed -2.4 add_value
    attribute @s generic.movement_speed modifier remove mhdp_core:weapon_movement_speed
    attribute @s generic.movement_speed modifier add mhdp_core:weapon_movement_speed 0 add_value
    attribute @s generic.attack_damage modifier remove mhdp_core:weapon_attack_damage
    attribute @s generic.attack_damage modifier add mhdp_core:weapon_attack_damage 5.0 add_value
    attribute @s generic.jump_strength modifier remove mhdp_core:weapon_jump_strength
