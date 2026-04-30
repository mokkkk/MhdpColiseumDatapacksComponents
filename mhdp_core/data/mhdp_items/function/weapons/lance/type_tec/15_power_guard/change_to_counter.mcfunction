#> mhdp_items:weapons/lance/type_tec/15_power_guard/change_to_counter
#
# ジャストガード → ガード
#
# @within function mhdp_items:weapons/lance/type_tec/3_normal_3/main

# タグ消去
    tag @s remove Wpn.Ss.Tec.PowerGuard
    tag @s remove Ply.Weapon.Guard
    tag @s remove Ply.Weapon.StaminaNotRegen
    
# 対象の処理を実行
    function mhdp_items:weapons/lance/type_tec/16_power_counter/start
