#> mhdp_items:weapons/bow/type_tec/5_shot_power/start
#
# 剛射 開始
#
# @within function mhdp_items:weapons/bow/type_tec/1_charge/change_to_chargeattack

# タグ付与
    tag @s add Wpn.Bw.Tec.Shot.Power

# attribute設定
    attribute @s generic.jump_strength modifier remove mhdp_core:weapon_jump_strength
    attribute @s generic.jump_strength modifier add mhdp_core:weapon_jump_strength -1 add_value

# スタミナ消費
    scoreboard players remove @s Ply.Stats.Stamina 150

say 弓 剛射