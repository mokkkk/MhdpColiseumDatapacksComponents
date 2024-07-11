#> mhdp_items:weapons/short_sword/type_tec/12_backstep/animation_0
#
# バックステップ アニメーション処理
#
# @within function mhdp_items:weapons/short_sword/type_tec/1_normal_1/main

# メイン
    # データ設定
        data modify storage mhdp_core:temp Args.IsDrawing set value true
        scoreboard players set #mhdp_arg_cmd_offset MhdpCore 43
        data modify storage mhdp_core:temp Args.Slot set value "mainhand"
    # アニメーション
        function mhdp_items:core/util/item_modify_no_attack
# サブ
    # データ設定
        data modify storage mhdp_core:temp Args.IsDrawing set value true
        scoreboard players set #mhdp_arg_cmd_offset MhdpCore 45
        data modify storage mhdp_core:temp Args.Slot set value "offhand"
    # アニメーション
        function mhdp_items:core/util/item_modify_offhand
