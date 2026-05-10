#> mhdp_items:weapons/lance/type_normal/24_guard/change_to_charge_counter_just
#
# ジャストガード → ガード
#
# @within function mhdp_items:weapons/lance/type_normal/3_normal_3/main

# タグ消去
    tag @s remove Ply.Weapon.Guard
    
# 対象の処理を実行
    function mhdp_items:weapons/lance/type_normal/8_guard_charge/start_from_just_guard
