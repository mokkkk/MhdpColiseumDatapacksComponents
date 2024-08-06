#> mhdp_items:weapons/short_sword/type_normal/3_sword_3/animation_1
#
# 剣コンボ3 アニメーション処理
#
# @within function mhdp_items:weapons/short_sword/type_normal/3_sword_3/main

# データ設定
    data modify storage mhdp_core:temp Args.IsDrawing set value true
    scoreboard players set #mhdp_arg_cmd_offset MhdpCore 18
    data modify storage mhdp_core:temp Args.Slot set value "mainhand"

# アニメーション
    function mhdp_items:core/util/item_modify_animation
