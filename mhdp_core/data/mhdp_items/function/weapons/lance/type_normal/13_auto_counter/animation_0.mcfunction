#> mhdp_items:weapons/lance/type_tec/13_auto_counter/animation_0
#
# カウンター突き アニメーション処理
#
# @within function mhdp_items:weapons/lance/type_tec/13_auto_counter/main

# アニメーション
    function api:weapon/animation.m {Slot:"mainhand", Cmd:"empty"}
    function api:weapon/animation.m {Slot:"offhand", Cmd:"guard_dash_sub_1"}
