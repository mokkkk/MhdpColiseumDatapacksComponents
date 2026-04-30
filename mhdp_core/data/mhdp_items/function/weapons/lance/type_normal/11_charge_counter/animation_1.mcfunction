#> mhdp_items:weapons/lance/type_tec/11_charge_counter/animation_1
#
# 溜めカウンター アニメーション処理
#
# @within function mhdp_items:weapons/lance/type_tec/11_charge_counter/main

# アニメーション
    function api:weapon/animation.m {Slot:"mainhand", Cmd:"charge_counter_1"}
    function api:weapon/animation.m {Slot:"offhand", Cmd:"guard_sub_0"}
