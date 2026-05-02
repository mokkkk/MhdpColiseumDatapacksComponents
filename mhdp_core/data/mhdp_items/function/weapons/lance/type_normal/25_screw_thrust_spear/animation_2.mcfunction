#> mhdp_items:weapons/lance/type_normal/12_counter_spear/animation_0
#
# カウンター突き アニメーション処理
#
# @within function mhdp_items:weapons/lance/type_normal/12_counter_spear/main

# アニメーション
    function api:weapon/animation.m {Slot:"mainhand", Cmd:"empty"}
    function api:weapon/animation.m {Slot:"offhand", Cmd:"guard_dash_sub_1"}
