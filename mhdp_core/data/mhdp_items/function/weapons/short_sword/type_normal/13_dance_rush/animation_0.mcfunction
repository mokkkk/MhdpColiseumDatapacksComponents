#> mhdp_items:weapons/short_sword/type_normal/12_rush/animation_0
#
# 通常コンボ3 アニメーション処理
#
# @within function mhdp_items:weapons/short_sword/type_normal/12_rush/main

# アニメーション
    function api:weapon/animation.m {Slot:"mainhand", Cmd:"drawing"}
    function api:weapon/animation.m {Slot:"offhand", Cmd:"normal_3_1_sub"}
