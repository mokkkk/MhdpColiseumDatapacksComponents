#> mhdp_items:weapons/short_sword/type_normal/11_spin/animation_2
#
# 回転斬り アニメーション処理
#
# @within function mhdp_items:weapons/short_sword/type_normal/11_spin/main

# アニメーション
    function api:weapon/animation.m {Slot:"mainhand", Cmd:"empty"}
    function api:weapon/animation.m {Slot:"offhand", Cmd:"32_bash_1_4_sub"}
