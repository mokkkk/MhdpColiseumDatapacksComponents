#> mhdp_items:weapons/lance/type_normal/24_screw_thrust/animation_1
#
# 溜めカウンター アニメーション処理
#
# @within function mhdp_items:weapons/lance/type_normal/24_screw_thrust/main

# アニメーション
    function api:weapon/animation.m {Slot:"mainhand", Cmd:"charge_counter_1"}
    function api:weapon/animation.m {Slot:"offhand", Cmd:"spear_sub_1"}
