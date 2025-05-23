#> mhdp_items:weapons/great_sword/type_tec/3_tackle/start
#
# タックル 開始
#
# @within function mhdp_items:weapons/great_sword/type_tec/1_charge/change_to_chargeattack

# タグ付与
    tag @s add Wpn.Gs.Tec.Tackle

# attribute設定
    attribute @s generic.jump_strength modifier remove mhdp_core:weapon_jump_strength
    attribute @s generic.jump_strength modifier add mhdp_core:weapon_jump_strength -1 add_value

# スタミナ消費
    scoreboard players remove @s Ply.Stats.Stamina 150
    tag @s add Ply.Weapon.StaminaNotRegen

# say 武器操作：大剣・タックル