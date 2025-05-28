#> mhdp_items:weapons/short_sword/type_tec/1_normal_1/animation_3
#
# 溜め アニメーション処理
#
# @within function mhdp_items:weapons/short_sword/type_tec/1_normal_1/main

# # データ設定
#     data modify storage mhdp_core:temp Args.IsDrawing set value true
#     scoreboard players set #mhdp_arg_cmd_offset MhdpCore 7
#     data modify storage mhdp_core:temp Args.Slot set value "mainhand"

# # アニメーション
#     function mhdp_items:core/util/item_modify_animation

# アニメーション
    function api:weapon/animation.m {Slot:"mainhand", Cmd:"horizon_2_4"}
    function api:weapon/animation.m {Slot:"offhand", Cmd:"normal_1_sub_1"}
