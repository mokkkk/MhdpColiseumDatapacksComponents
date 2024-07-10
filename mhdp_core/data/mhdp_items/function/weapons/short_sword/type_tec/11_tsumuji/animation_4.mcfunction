#> mhdp_items:weapons/short_sword/type_tec/11_tsumuji/animation_4
#
# 旋刈り アニメーション処理
#
# @within function mhdp_items:weapons/short_sword/type_tec/11_tsumuji/main

# データ設定
    data modify storage mhdp_core:temp Args.IsDrawing set value true
    scoreboard players set #mhdp_arg_cmd_offset MhdpCore 42
    data modify storage mhdp_core:temp Args.Slot set value "mainhand"

# アニメーション
    function mhdp_items:core/util/item_modify_animation
