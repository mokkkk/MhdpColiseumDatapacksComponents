#> mhdp_items:weapons/short_sword/type_normal/17_jumpslash_high/animation_5
#
# 駆け上がり斬り アニメーション処理
#
# @within function mhdp_items:weapons/short_sword/type_normal/5_horizon_2/main

# アニメーションリセット
    # メイン
        data modify storage mhdp_core:temp Args.IsDrawing set value true
        scoreboard players set #mhdp_arg_cmd_offset MhdpCore 1
        function mhdp_items:core/util/item_modify_animation
    # サブ
        data modify storage mhdp_core:temp Args.IsDrawing set value true
        scoreboard players set #mhdp_arg_cmd_offset MhdpCore 3
        function mhdp_items:core/util/item_modify_offhand
    # attribute
        function mhdp_items:weapons/short_sword/util/set_status
