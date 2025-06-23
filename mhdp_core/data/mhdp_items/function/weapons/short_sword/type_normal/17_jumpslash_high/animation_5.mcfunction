#> mhdp_items:weapons/short_sword/type_tec/17_jumpslash_high/animation_5
#
# 駆け上がり斬り アニメーション処理
#
# @within function mhdp_items:weapons/short_sword/type_tec/5_horizon_2/main

# アニメーション
    function api:weapon/animation.m {Slot:"mainhand", Cmd:"drawing"}
    function api:weapon/animation.m {Slot:"offhand", Cmd:"drawing_sub"}
