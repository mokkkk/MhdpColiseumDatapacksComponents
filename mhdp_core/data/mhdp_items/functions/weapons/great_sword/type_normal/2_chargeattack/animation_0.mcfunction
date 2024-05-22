#> mhdp_items:weapons/great_sword/type_normal/2_chargeattack/animation_0
#
# 溜め アニメーション処理
#
# @within function mhdp_items:weapons/great_sword/type_normal/2_chargeattack/main

# データ設定
    data modify storage mhdp_core:temp Args.IsDrawing set value true
    scoreboard players set #mhdp_arg_cmd_offset MhdpCore 6
    data modify storage mhdp_core:temp Args.Slot set value "mainhand"

# アニメーション
    function mhdp_items:core/util/item_modify_animation
