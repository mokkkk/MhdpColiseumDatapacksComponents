#> mhdp_items:weapons/lance/type_normal/7_guard/animation_1
#
# ガード アニメーション処理
#
# @within function mhdp_items:weapons/lance/type_tec/3_tackle/main

# アニメーション
    function api:weapon/animation.m {Slot:"mainhand", Cmd:"guard"}
    function api:weapon/animation.m {Slot:"offhand", Cmd:"guard_sub_1"}
