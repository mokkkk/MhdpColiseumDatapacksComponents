#> mhdp_items:weapons/short_sword/type_tec/24_guard/animation_1
#
# ガード アニメーション処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/3_tackle/main

# アニメーション
    function api:weapon/animation.m {Slot:"mainhand", Cmd:"drawing"}
    function api:weapon/animation.m {Slot:"offhand", Cmd:"guard_2"}
