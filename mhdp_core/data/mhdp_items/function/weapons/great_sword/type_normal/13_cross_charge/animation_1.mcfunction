#> mhdp_items:weapons/great_sword/type_normal/13_cross_charge/animation_1
#
# 十字斬り溜め アニメーション処理
#
# @within function mhdp_items:weapons/great_sword/type_normal/13_cross_charge/main

# データ設定
    data modify storage mhdp_core:temp Args.IsDrawing set value true
    scoreboard players set #mhdp_arg_cmd_offset MhdpCore 14
    data modify storage mhdp_core:temp Args.Slot set value "mainhand"

# アニメーション
    function mhdp_items:core/util/item_modify_animation