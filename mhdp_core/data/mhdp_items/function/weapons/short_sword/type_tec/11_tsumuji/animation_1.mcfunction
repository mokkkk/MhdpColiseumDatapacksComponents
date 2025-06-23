#> mhdp_items:weapons/short_sword/type_tec/11_tsumuji/animation_1
#
# 旋刈り アニメーション処理
#
# @within function mhdp_items:weapons/short_sword/type_tec/11_tsumuji/main

# アニメーション
    function api:weapon/animation.m {Slot:"mainhand", Cmd:"drawing"}
    function api:weapon/animation.m {Slot:"offhand", Cmd:"spin_3_sub"}
