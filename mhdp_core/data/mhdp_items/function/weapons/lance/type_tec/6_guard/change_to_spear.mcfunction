#> mhdp_items:weapons/lance/type_tec/6_guard/change_to_spear
#
# ジャストガード → ガード
#
# @within function mhdp_items:weapons/lance/type_tec/6_guard/main

# タグ消去
    tag @s remove Wpn.Ss.Tec.Guard
    tag @s remove Wpn.Ss.Tec.Guard.Just
    tag @s remove Ply.Weapon.Guard
    tag @s remove Ply.Weapon.StaminaNotRegen
    
# 対象の処理を実行
    function mhdp_items:weapons/lance/type_tec/18_dash/start
