#> mhdp_items:weapons/lance/type_tec/15_power_guard/animation_2
#
# ガード アニメーション処理
#
# @within function mhdp_items:weapons/lance/type_tec/3_tackle/main

# アニメーション
    function api:weapon/animation.m {Slot:"mainhand", Cmd:"spear_4"}
    function api:weapon/animation.m {Slot:"offhand", Cmd:"power_guard_sub"}
