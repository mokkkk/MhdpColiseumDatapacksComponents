#> mhdp_items:weapons/bow/type_tec/4_charge_step/start
#
# チャージステップ 開始
#
# @within function mhdp_items:weapons/bow/type_tec/1_charge/change_to_chargeattack

# タグ付与
    tag @s add Wpn.Bw.Tec.ChargeStep

# attribute設定
    attribute @s jump_strength modifier remove mhdp_core:weapon_jump_strength
    attribute @s jump_strength modifier add mhdp_core:weapon_jump_strength -1 add_value

# スタミナ消費
    tag @s add Ply.Weapon.StaminaNotRegen
    scoreboard players remove @s Ply.Stats.Stamina 100

# say 武器操作：弓 チャージステップ