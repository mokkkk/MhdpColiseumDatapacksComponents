#> mhdp_items:weapons/short_sword/type_tec/1_normal_1/animation_0
#
# 通常コンボ1 アニメーション処理
#
# @within function mhdp_items:weapons/short_sword/type_tec/1_normal_1/main

# # メイン
#     # データ設定
#         data modify storage mhdp_core:temp Args.IsDrawing set value true
#         scoreboard players set #mhdp_arg_cmd_offset MhdpCore 4
#         data modify storage mhdp_core:temp Args.Slot set value "mainhand"
#     # アニメーション
#         function mhdp_items:core/util/item_modify_animation
# # サブ
#     # データ設定
#         data modify storage mhdp_core:temp Args.IsDrawing set value true
#         scoreboard players set #mhdp_arg_cmd_offset MhdpCore 8
#         data modify storage mhdp_core:temp Args.Slot set value "offhand"
#     # アニメーション
#         function mhdp_items:core/util/item_modify_offhand

# アニメーション
    function api:weapon/animation.m {Slot:"mainhand", Cmd:"normal_2_1"}
    function api:weapon/animation.m {Slot:"offhand", Cmd:"normal_1_sub_2"}
