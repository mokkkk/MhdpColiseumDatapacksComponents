#> mhdp_items:weapons/short_sword/type_tec/2_normal_2/animation_0
#
# 通常コンボ2 アニメーション処理
#
# @within function mhdp_items:weapons/short_sword/type_tec/2_normal_2/main

# メイン
    # データ設定
        data modify storage mhdp_core:temp Args.IsDrawing set value true
        scoreboard players set #mhdp_arg_cmd_offset MhdpCore 9
        data modify storage mhdp_core:temp Args.Slot set value "mainhand"
    # アニメーション
        function mhdp_items:core/util/item_modify_animation
# サブ
    # データ設定
        data modify storage mhdp_core:temp Args.IsDrawing set value true
        scoreboard players set #mhdp_arg_cmd_offset MhdpCore 8
        data modify storage mhdp_core:temp Args.Slot set value "offhand"
    # アニメーション
        function mhdp_items:core/util/item_modify_offhand
