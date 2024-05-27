#> mhdp_items:weapons/great_sword/type_tec/6_charge_high/animation_1
#
# 強溜め アニメーション処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/6_charge_high/main

# データ設定
    data modify storage mhdp_core:temp Args.IsDrawing set value true
    scoreboard players set #mhdp_arg_cmd_offset MhdpCore 14
    data modify storage mhdp_core:temp Args.Slot set value "mainhand"

# アニメーション
    function mhdp_items:core/util/item_modify_animation
