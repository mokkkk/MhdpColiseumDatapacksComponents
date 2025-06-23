#> mhdp_items:weapons/bow/type_normal/1_charge/change_to_shot
#
# 溜め → 射撃
#
# @within function mhdp_items:weapons/bow/type_normal/1_charge/main

# 共通処理
    function mhdp_items:weapons/bow/util/end_attack

# タグ消去
    tag @s remove Ply.Weapon.StaminaNotRegen
    
# 対象の処理を実行
    function mhdp_items:weapons/bow/type_normal/2_shot/start
