#> mhdp_items:weapons/lance/type_tec/6_guard/change_to_guard_dash
#
# ガード → ガードダッシュ
#
# @within function mhdp_items:weapons/lance/type_tec/6_guard/main

# タグ消去
    tag @s remove Ply.Weapon.StaminaNotRegen
    tag @s remove Wpn.Lc.Tec.Guard.Just
    tag @s remove Ply.Weapon.Guard
    
# 対象の処理を実行
    function mhdp_items:weapons/lance/type_tec/7_guard_dash/start
