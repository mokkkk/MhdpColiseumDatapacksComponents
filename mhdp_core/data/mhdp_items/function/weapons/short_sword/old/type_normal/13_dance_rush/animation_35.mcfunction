#> mhdp_items:weapons/short_sword/type_tec/11_tsumuji/animation_5
#
# 回転斬り アニメーション処理
#
# @within function mhdp_items:weapons/short_sword/type_tec/11_tsumuji/main

# メイン
    # データ設定
        data modify storage mhdp_core:temp Args.IsDrawing set value true
        scoreboard players set #mhdp_arg_cmd_offset MhdpCore 1
        data modify storage mhdp_core:temp Args.Slot set value "mainhand"
    # アニメーション
        function mhdp_items:core/util/item_modify_const
# サブ
    # データ設定
        data modify storage mhdp_core:temp Args.IsDrawing set value true
        scoreboard players set #mhdp_arg_cmd_offset MhdpCore 48
        data modify storage mhdp_core:temp Args.Slot set value "offhand"
    # アニメーション
        function mhdp_items:core/util/item_modify_offhand
