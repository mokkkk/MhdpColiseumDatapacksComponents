#> mhdp_items:weapons/bow/type_tec/10_flying_shot/animation_1
#
# 飛翔睨み撃ち アニメーション処理
#
# @within function mhdp_items:weapons/short_sword/type_tec/1_normal_1/main

# データ設定
    data modify storage mhdp_core:temp Args.IsDrawing set value true
    scoreboard players set #mhdp_arg_cmd_offset MhdpCore 12
    data modify storage mhdp_core:temp Args.Slot set value "mainhand"
# アニメーション
    function mhdp_items:core/util/item_modify_animation
