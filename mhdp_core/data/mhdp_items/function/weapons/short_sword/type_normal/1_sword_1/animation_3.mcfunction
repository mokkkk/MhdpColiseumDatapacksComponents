#> mhdp_items:weapons/short_sword/type_normal/1_sword_1/animation_3
#
# 剣コンボ1 アニメーション処理
#
# @within function mhdp_items:weapons/short_sword/type_normal/1_sword_1/main

# データ設定
    data modify storage mhdp_core:temp Args.IsDrawing set value true
    scoreboard players set #mhdp_arg_cmd_offset MhdpCore 7
    data modify storage mhdp_core:temp Args.Slot set value "mainhand"

# アニメーション
    function mhdp_items:core/util/item_modify_animation
