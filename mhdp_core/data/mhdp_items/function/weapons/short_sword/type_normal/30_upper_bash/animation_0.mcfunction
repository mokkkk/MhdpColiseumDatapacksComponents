#> mhdp_items:weapons/short_sword/type_tec/30_upper_bash/animation_0
#
# 水平斬りコンボ3 アニメーション処理
#
# @within function mhdp_items:weapons/short_sword/type_tec/30_upper_bash/main

# アニメーション
    function api:weapon/animation.m {Slot:"mainhand", Cmd:"drawing"}
    function api:weapon/animation.m {Slot:"offhand", Cmd:"upper_bash_sub_0"}
