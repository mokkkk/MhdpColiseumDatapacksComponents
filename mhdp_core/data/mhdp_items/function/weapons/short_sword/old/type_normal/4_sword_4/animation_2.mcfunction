#> mhdp_items:weapons/short_sword/type_normal/4_sword_4/animation_2
#
# 剣コンボ4 アニメーション処理
#
# @within function mhdp_items:weapons/short_sword/type_normal/4_sword_4/main

# データ設定
    data modify storage mhdp_core:temp Args.IsDrawing set value true
    scoreboard players set #mhdp_arg_cmd_offset MhdpCore 23
    data modify storage mhdp_core:temp Args.Slot set value "mainhand"

# アニメーション
    function mhdp_items:core/util/item_modify_animation
