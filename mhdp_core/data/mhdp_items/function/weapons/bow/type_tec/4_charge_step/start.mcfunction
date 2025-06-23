#> mhdp_items:weapons/bow/type_tec/4_charge_step/start
#
# チャージステップ 開始
#
# @within function mhdp_items:weapons/bow/type_tec/1_charge/change_to_chargeattack

# 前処理
    function mhdp_items:weapons/bow/util/before_attack

# タグ付与
    tag @s add Wpn.Bw.Tec.ChargeStep
    tag @s remove Ply.Weapon.NoOpe

# スタミナ消費
    tag @s add Ply.Weapon.StaminaNotRegen
    scoreboard players remove @s Ply.Stats.Stamina 100

# say 武器操作：弓 チャージステップ