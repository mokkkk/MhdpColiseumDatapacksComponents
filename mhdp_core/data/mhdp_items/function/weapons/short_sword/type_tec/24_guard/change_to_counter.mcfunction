#> mhdp_items:weapons/short_sword/type_tec/24_guard/change_to_backstep
#
# ジャストガード → ガード
#
# @within function mhdp_items:weapons/short_sword/type_tec/3_normal_3/main

# タグ消去
    tag @s remove Ply.Weapon.StaminaNotRegen
    tag @s remove Ply.Weapon.Guard

# 対象の処理を実行
    function mhdp_items:weapons/short_sword/type_tec/25_just_counter/start
