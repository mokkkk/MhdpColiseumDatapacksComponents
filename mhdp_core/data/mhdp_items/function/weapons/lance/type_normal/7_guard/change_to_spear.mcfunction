#> mhdp_items:weapons/lance/type_normal/24_guard/change_to_spear
#
# ジャストガード → 突き
#
# @within function mhdp_items:weapons/lance/type_normal/3_normal_3/main

# タグ消去
    tag @s remove Ply.Weapon.Guard
    
# 対象の処理を実行
    function mhdp_items:weapons/lance/type_normal/1_spear_1/start
