#> mhdp_items:weapons/great_sword/util/guard
#
# 武器のガード成功時処理
#
# @within function mhdp_items:core/switch/macro/m.guard

# 斬れ味消費
    function api:weapon_operation/decrease_sharpness.m {Value:2}
