#> mhdp_items:weapons/lance/type_tec/24_guard/change_to_charge_counter
#
# ジャストガード → ガード
#
# @within function mhdp_items:weapons/lance/type_tec/3_normal_3/main

# タグ消去
    tag @s remove Wpn.Lc.Normal.Guard
    tag @s remove Ply.Weapon.Guard
    
# 対象の処理を実行
    function mhdp_items:weapons/lance/type_normal/8_guard_charge/start
