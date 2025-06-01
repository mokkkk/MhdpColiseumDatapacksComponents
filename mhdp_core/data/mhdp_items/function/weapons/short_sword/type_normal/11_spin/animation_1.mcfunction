#> mhdp_items:weapons/short_sword/type_normal/11_spin/animation_1
#
# 回転斬り アニメーション処理
#
# @within function mhdp_items:weapons/short_sword/type_normal/11_spin/main

# アニメーション
    function api:weapon/animation.m {Slot:"mainhand", Cmd:"drawing"}
    function api:weapon/animation.m {Slot:"offhand", Cmd:"spin_3_sub"}
