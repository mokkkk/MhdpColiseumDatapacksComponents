#> mhdp_items:weapons/short_sword/type_tec/6_horizon_3/animation_4
#
# 水平斬りコンボ3 アニメーション処理
#
# @within function mhdp_items:weapons/short_sword/type_tec/6_horizon_3/main

# アニメーション
    function api:weapon/animation.m {Slot:"mainhand", Cmd:"backstep_1"}
    function api:weapon/animation.m {Slot:"offhand", Cmd:"drawing_sub"}
