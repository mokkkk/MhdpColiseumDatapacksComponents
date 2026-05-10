#> mhdp_items:weapons/lance/type_normal/6_guard/change_to_guard
# ジャストガード → ガード
#
# @within function mhdp_items:weapons/short_sword/type_normal/3_normal_3/main

# タグ消去
    tag @s remove Wpn.Lc.Normal.Guard.Just
    
# 対象の処理を実行
    function mhdp_items:weapons/lance/type_normal/7_guard/start_from_just_guard
