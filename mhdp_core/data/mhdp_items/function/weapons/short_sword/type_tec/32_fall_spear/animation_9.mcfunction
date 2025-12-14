#> mhdp_items:weapons/short_sword/type_tec/27_charge_spear/animation_9
#
# 溜め斬り落とし アニメーション処理
#
# @within function mhdp_items:weapons/short_sword/type_tec/27_charge_spear/main

# アニメーション
    function api:weapon/animation.m {Slot:"mainhand", Cmd:"charge_spear_10"}
    function api:weapon/animation.m {Slot:"offhand", Cmd:"charge_spear_10_sub"}
