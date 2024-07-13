#> mhdp_items:weapons/short_sword/util/drawing
#
# 武器の抜刀時処理
#
# @within function mhdp_items:core/switch/macro/m.drawing

# TODO: 武器の初期化処理
    say TODO:片手剣抜刀処理

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# サブ武器装備
    # タグ付与
        tag @s add Ply.Weapon.Drawing.Sub
    # アイテムの用意
        item replace block 0 0 0 container.0 with ender_eye
    # サブ武器装備
        item replace entity @s weapon.offhand from block 0 0 0 container.0
        item replace block 0 0 0 container.0 with air
    # 武器のデータ書き換え
        scoreboard players set #mhdp_arg_cmd_offset MhdpCore 3
        function mhdp_items:core/util/item_modify_draw_sub

# ステータス設定
    function mhdp_items:weapons/short_sword/util/set_status
