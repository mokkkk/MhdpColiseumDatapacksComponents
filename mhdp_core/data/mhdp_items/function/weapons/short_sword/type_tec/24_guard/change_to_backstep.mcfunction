#> mhdp_items:weapons/short_sword/type_tec/24_guard/change_to_backstep
#
# ガード → バックステップ
#
# @within function mhdp_items:weapons/short_sword/type_tec/3_normal_3/main

# タグ消去
    tag @s remove Ply.Weapon.StaminaNotRegen
    tag @s remove Ply.Weapon.Guard
    
# 対象の処理を実行
    function mhdp_items:weapons/short_sword/type_tec/12_backstep/start
