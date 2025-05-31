#> mhdp_items:weapons/short_sword/type_tec/6_horizon_3/start
#
# 水平斬りコンボ3 開始
#
# @within function mhdp_items:weapons/short_sword/type_tec/1_charge/change_to_chargeattack

# 前処理
    function mhdp_items:weapons/short_sword/util/before_attack

# タグ付与
    tag @s add Wpn.Ss.Tec.Horizon.3

# say 武器操作：片手剣 水平斬りコンボ3・回転切り上げ