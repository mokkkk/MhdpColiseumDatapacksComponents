#> mhdp_items:weapons/lance/type_tec/8_dash_spear/animation_1
#
# 飛び込み突き アニメーション処理
#
# @within function mhdp_items:weapons/lance/type_tec/8_dash_spear/main

# アニメーション
    function api:weapon/animation.m {Slot:"mainhand", Cmd:"dash_spear_1"}
    function api:weapon/animation.m {Slot:"offhand", Cmd:"guard_dash_sub_1"}
