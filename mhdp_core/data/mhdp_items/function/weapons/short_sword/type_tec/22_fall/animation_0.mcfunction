#> mhdp_items:weapons/short_sword/type_tec/5_horizon_2/animation_0
#
# フォールバッシュ・強 アニメーション処理
#
# @within function mhdp_items:weapons/short_sword/type_tec/5_horizon_2/main

# アニメーション
    function api:weapon/animation.m {Slot:"mainhand", Cmd:"drawing"}
    function api:weapon/animation.m {Slot:"offhand", Cmd:"fall_1_sub"}
