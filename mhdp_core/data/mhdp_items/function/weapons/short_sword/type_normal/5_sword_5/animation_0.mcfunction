#> mhdp_items:weapons/short_sword/type_normal/5_sword_5/animation_0
#
# 剣コンボ5 アニメーション処理
#
# @within function mhdp_items:weapons/short_sword/type_normal/5_sword_5/main

# アニメーション
    function api:weapon/animation.m {Slot:"mainhand", Cmd:"drawing"}
    function api:weapon/animation.m {Slot:"offhand", Cmd:"spin_2_sub"}
