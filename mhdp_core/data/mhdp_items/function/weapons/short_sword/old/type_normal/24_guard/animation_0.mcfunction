#> mhdp_items:weapons/short_sword/type_normal/24_guard/animation_0
#
# ガード アニメーション処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/3_tackle/main

# メイン
    # データ設定
        data modify storage mhdp_core:temp Args.IsDrawing set value true
        scoreboard players set #mhdp_arg_cmd_offset MhdpCore 1
        data modify storage mhdp_core:temp Args.Slot set value "mainhand"
    # アニメーション
        function mhdp_items:core/util/item_modify_animation
# サブ
    # データ設定
        data modify storage mhdp_core:temp Args.IsDrawing set value true
        scoreboard players set #mhdp_arg_cmd_offset MhdpCore 67
        data modify storage mhdp_core:temp Args.Slot set value "offhand"
    # アニメーション
        function mhdp_items:core/util/item_modify_offhand
