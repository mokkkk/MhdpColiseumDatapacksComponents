#> mhdp_items:weapons/short_sword/type_tec/10_spin/animation_0
#
# 回転斬り アニメーション処理
#
# @within function mhdp_items:weapons/short_sword/type_tec/10_spin/main

# # メイン
#     # データ設定
#         data modify storage mhdp_core:temp Args.IsDrawing set value true
#         scoreboard players set #mhdp_arg_cmd_offset MhdpCore 9
#         data modify storage mhdp_core:temp Args.Slot set value "mainhand"
#     # アニメーション
#         function mhdp_items:core/util/item_modify_animation
# # サブ
#     # データ設定
#         data modify storage mhdp_core:temp Args.IsDrawing set value true
#         scoreboard players set #mhdp_arg_cmd_offset MhdpCore 1
#         data modify storage mhdp_core:temp Args.Slot set value "offhand"
#     # アニメーション
#         function mhdp_items:core/util/item_modify_const

# アニメーション
    function api:weapon/animation.m {Slot:"mainhand", Cmd:"drawing"}
    function api:weapon/animation.m {Slot:"offhand", Cmd:"spin_2_sub"}
