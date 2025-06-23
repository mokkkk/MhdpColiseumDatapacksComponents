#> mhdp_items:weapons/short_sword/type_tec/7_bash_1/animation_0
#
# 水平斬りコンボ3 アニメーション処理
#
# @within function mhdp_items:weapons/short_sword/type_tec/7_bash_1/main

# アニメーション
    function api:weapon/animation.m {Slot:"mainhand", Cmd:"drawing"}
    function api:weapon/animation.m {Slot:"offhand", Cmd:"bash_1_1_sub"}
