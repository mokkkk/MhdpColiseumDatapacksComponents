#> mhdp_items:weapons/short_sword/type_tec/10_spin/animation_0
#
# 回転斬り アニメーション処理
#
# @within function mhdp_items:weapons/short_sword/type_tec/10_spin/main

# アニメーション
    function api:weapon/animation.m {Slot:"mainhand", Cmd:"drawing"}
    function api:weapon/animation.m {Slot:"offhand", Cmd:"spin_2_sub"}
