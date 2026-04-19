#> mhdp_items:weapons/lance/type_tec/18_dash/change_to_guard
#
# 突進 → ガード
#
# @within function mhdp_items:weapons/lance/type_tec/1_charge/change_to_chargeattack

# 前に滑りながらガードする
    execute rotated ~ 0 run function api:weapon_operation/use_player_motion.m {Strength:7000, IsForce:true, IsAdjust:false}

# 移行
    function mhdp_items:weapons/lance/type_tec/6_guard/start