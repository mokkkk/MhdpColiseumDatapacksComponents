#> mhdp_items:weapons/bow/type_tec/2_shot_normal/start
#
# 射撃 開始
#
# @within function mhdp_items:weapons/bow/type_tec/1_charge/change_to_chargeattack

# タグ付与
    tag @s add Wpn.Bw.Tec.Shot

# attribute設定
    attribute @s generic.jump_strength modifier remove mhdp_core:weapon_jump_strength
    attribute @s generic.jump_strength modifier add mhdp_core:weapon_jump_strength -1 add_value

# スタミナ消費
    scoreboard players remove @s Ply.Stats.Stamina 80

# say 武器操作：弓 射撃