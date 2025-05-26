#> mhdp_items:weapons/short_sword/type_tec/9_bash_3/animation_0
#
# ハードバッシュ アニメーション処理
#
# @within function mhdp_items:weapons/short_sword/type_tec/9_bash_3/main

# アニメーション
    function api:weapon/animation.m {Slot:"mainhand", Cmd:"drawing"}
    function api:weapon/animation.m {Slot:"offhand", Cmd:"bash_3_1_sub"}
