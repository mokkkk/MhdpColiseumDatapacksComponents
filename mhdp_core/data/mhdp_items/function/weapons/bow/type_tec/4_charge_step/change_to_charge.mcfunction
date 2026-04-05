#> mhdp_items:weapons/bow/type_tec/4_charge_step/change_to_charge
#
# チャージステップ → 溜め
#
# @within function mhdp_items:weapons/short_sword/type_tec/1_normal_1/main

# 共通処理
    function mhdp_items:weapons/bow/util/end_attack

# タグ消去
    tag @s remove Wpn.Bw.Tec.ChargeStep
    tag @s remove Ply.Weapon.StaminaNotRegen
    
# 対象の処理を実行
    function mhdp_items:weapons/bow/type_tec/1_charge/start_from_chargestep
