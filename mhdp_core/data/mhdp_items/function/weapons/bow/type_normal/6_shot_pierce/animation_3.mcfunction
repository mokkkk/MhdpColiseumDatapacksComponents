#> mhdp_items:weapons/bow/type_tec/6_shot_pierce/animation_3
#
# 竜の一矢 アニメーション処理
#
# @within function mhdp_items:weapons/short_sword/type_tec/1_normal_1/main

# データ設定
    data modify storage mhdp_core:temp Args.IsDrawing set value true
    scoreboard players set #mhdp_arg_cmd_offset MhdpCore 6
    data modify storage mhdp_core:temp Args.Slot set value "mainhand"
# アニメーション
    function mhdp_items:core/util/item_modify_animation