#> mhdp_items:weapons/short_sword/type_tec/30_upper_bash/animation_2
#
# 水平斬りコンボ3 アニメーション処理
#
# @within function mhdp_items:weapons/short_sword/type_tec/30_upper_bash/main

# アニメーション
    function api:weapon/animation.m {Slot:"mainhand", Cmd:"backstep_1"}
    function api:weapon/animation.m {Slot:"offhand", Cmd:"upper_bash_sub_1"}
