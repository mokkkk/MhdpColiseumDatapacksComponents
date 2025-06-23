#> mhdp_items:weapons/short_sword/type_tec/3_normal_3/animation_4
#
# 通常コンボ3 アニメーション処理
#
# @within function mhdp_items:weapons/short_sword/type_tec/3_normal_3/main

# アニメーション
    function api:weapon/animation.m {Slot:"mainhand", Cmd:"normal_1_1"}
    function api:weapon/animation.m {Slot:"offhand", Cmd:"normal_3_4_sub"}
