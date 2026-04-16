#> mhdp_items:weapons/lance/type_tec/10_step/animation_0
#
# ガード アニメーション処理
#
# @within function mhdp_items:weapons/lance/type_tec/3_tackle/main

# アニメーション
    function api:weapon/animation.m {Slot:"mainhand", Cmd:"drawing"}
    function api:weapon/animation.m {Slot:"offhand", Cmd:"drawing_sub"}
