#> mhdp_items:weapons/lance/type_tec/7_guard_dash/change_to_guard
#
# ガードダッシュ → ガード
#
# @within function mhdp_items:weapons/lance/type_tec/7_guard_dash/main

# タグ消去
    tag @s remove Wpn.Ls.Tec.Guard
    tag @s remove Ply.Weapon.Guard
    
# 対象の処理を実行
    function mhdp_items:weapons/lance/type_tec/6_guard/start_from_guard_dash
