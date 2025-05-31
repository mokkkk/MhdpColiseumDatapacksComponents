#> mhdp_items:weapons/short_sword/type_tec/19_moveslash/start
#
# 通常コンボ1 開始
#
# @within function mhdp_items:weapons/short_sword/type_tec/1_charge/change_to_chargeattack

# 前処理
    function mhdp_items:weapons/short_sword/util/before_attack

# タグ付与
    tag @s add Wpn.Ss.Tec.ChargeSlash

# say武器操作： 片手剣 溜め斬り