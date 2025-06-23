#> mhdp_items:weapons/short_sword/type_tec/12_backstep/animation_0
#
# バックステップ アニメーション処理
#
# @within function mhdp_items:weapons/short_sword/type_tec/1_normal_1/main

# アニメーション
    function api:weapon/animation.m {Slot:"mainhand", Cmd:"backstep_1"}
    function api:weapon/animation.m {Slot:"offhand", Cmd:"backstep_3_sub"}
