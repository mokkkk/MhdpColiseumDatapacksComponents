#> mhdp_items:weapons/great_sword/type_normal/1_charge/animation_1
#
# 溜め アニメーション処理
#
# @within function mhdp_items:weapons/great_sword/type_normal/1_charge/main

# データ設定
    data modify storage mhdp_core:temp Args.IsDrawing set value true
    scoreboard players set #mhdp_arg_cmd_offset MhdpCore 4
    data modify storage mhdp_core:temp Args.Slot set value "mainhand"

# アニメーション
    function mhdp_items:core/util/item_modify_animation
