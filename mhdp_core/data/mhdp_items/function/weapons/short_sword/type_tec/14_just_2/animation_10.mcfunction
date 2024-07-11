#> mhdp_items:weapons/short_sword/type_tec/6_horizon_3/animation_5
#
# 水平斬りコンボ3 アニメーション処理
#
# @within function mhdp_items:weapons/short_sword/type_tec/6_horizon_3/main

# データ設定
    data modify storage mhdp_core:temp Args.IsDrawing set value true
    scoreboard players set #mhdp_arg_cmd_offset MhdpCore 53
    data modify storage mhdp_core:temp Args.Slot set value "mainhand"
# アニメーション
    function mhdp_items:core/util/item_modify_animation
