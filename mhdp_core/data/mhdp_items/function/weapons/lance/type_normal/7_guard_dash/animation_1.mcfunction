#> mhdp_items:weapons/lance/type_tec/7_guard_dash/animation_1
#
# ガード アニメーション処理
#
# @within function mhdp_items:weapons/lance/type_tec/3_tackle/main

# アニメーション
    function api:weapon/animation.m {Slot:"mainhand", Cmd:"guard"}
    function api:weapon/animation.m {Slot:"offhand", Cmd:"guard_dash_sub_1"}
