#> mhdp_items:weapons/long_sword/type_tec/28_critical_juncture_counter/start
#
# 鏡花の構え・カウンター 開始
#
# @within function mhdp_items:weapons/long_sword/type_tec/1_charge/change_to_chargeattack

# 前処理
    function mhdp_items:weapons/long_sword/util/before_attack

# タグ付与
    tag @s add Wpn.Ls.Tec.CriticalCounter
    tag @s remove Ply.Weapon.NoOpe
