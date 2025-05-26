#> mhdp_items:weapons/short_sword/type_normal/9_bash_3/animation_3
#
# ハードバッシュ アニメーション処理
#
# @within function mhdp_items:weapons/short_sword/type_normal/9_bash_3/main

# サブ
    # データ設定
        data modify storage mhdp_core:temp Args.IsDrawing set value true
        scoreboard players set #mhdp_arg_cmd_offset MhdpCore 41
        data modify storage mhdp_core:temp Args.Slot set value "offhand"
    # アニメーション
        function mhdp_items:core/util/item_modify_offhand
