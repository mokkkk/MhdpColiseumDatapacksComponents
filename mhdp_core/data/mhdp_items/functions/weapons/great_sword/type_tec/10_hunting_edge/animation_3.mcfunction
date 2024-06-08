#> mhdp_items:weapons/great_sword/type_tec/10_hunting_edge/animation_3
#
# ハンティングエッジ アニメーション処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/10_hunting_edge/main

# データ設定
    data modify storage mhdp_core:temp Args.IsDrawing set value true
    scoreboard players set #mhdp_arg_cmd_offset MhdpCore 9
    data modify storage mhdp_core:temp Args.Slot set value "mainhand"

# アニメーション
    function mhdp_items:core/util/item_modify_no_attack
