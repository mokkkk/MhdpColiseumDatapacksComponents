#> mhdp_items:weapons/bow/type_tec/6_shot_pierce/start
#
# 竜の一矢 開始
#
# @within function mhdp_items:weapons/bow/type_tec/1_charge/change_to_chargeattack

# タグ付与
    tag @s add Wpn.Bw.Normal.Shot.Pierce
    tag @s remove Ply.Weapon.NoOpe

# attribute設定
    attribute @s generic.jump_strength modifier remove mhdp_core:weapon_jump_strength
    attribute @s generic.jump_strength modifier add mhdp_core:weapon_jump_strength -1 add_value

# say 武器操作：弓 竜の一矢