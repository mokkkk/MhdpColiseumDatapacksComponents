#> mhdp_items:weapons/lance/type_tec/11_charge_counter/change_to_power_guard
#
# 溜めカウンター → パワーガードガード
#
# @within function mhdp_items:weapons/lance/type_tec/3_normal_3/main

# タグ消去
    tag @s remove Wpn.Lc.Tec.ChargeCounter
    tag @s remove Ply.Weapon.Guard
    
# 対象の処理を実行
    function mhdp_items:weapons/lance/type_tec/15_power_guard/start
