#> mhdp_items:weapons/short_sword/type_tec/2_normal_2/animation_3
#
# 溜め アニメーション処理
#
# @within function mhdp_items:weapons/short_sword/type_tec/2_normal_2/main

# データ設定
    data modify storage mhdp_core:temp Args.IsDrawing set value true
    scoreboard players set #mhdp_arg_cmd_offset MhdpCore 12
    data modify storage mhdp_core:temp Args.Slot set value "mainhand"

# アニメーション
    function mhdp_items:core/util/item_modify_animation
