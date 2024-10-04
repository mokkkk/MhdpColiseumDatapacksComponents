#> mhdp_items:weapons/great_sword/type_tec/14_upper_slash/animation_7
#
# 相殺斬り上げ アニメーション処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/14_upper_slash/main

# データ設定
    data modify storage mhdp_core:temp Args.IsDrawing set value true
    scoreboard players set #mhdp_arg_cmd_offset MhdpCore 44
    data modify storage mhdp_core:temp Args.Slot set value "mainhand"

# アニメーション
    function mhdp_items:core/util/item_modify_no_attack
