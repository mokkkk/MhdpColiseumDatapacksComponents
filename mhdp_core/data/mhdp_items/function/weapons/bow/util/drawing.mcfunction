#> mhdp_items:weapons/bow/util/drawing
#
# 武器の抜刀時処理
#
# @within function mhdp_items:core/switch/macro/m.drawing

# TODO: 武器の初期化処理
    say TODO:弓抜刀処理

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# ダミー用サブ武器装備
    # タグ付与
        tag @s add Ply.Weapon.Drawing.Sub
    # アイテムの用意
        item replace block 0 0 0 container.0 with ender_eye
    # サブ武器装備
        item replace entity @s weapon.offhand from block 0 0 0 container.0
        item replace block 0 0 0 container.0 with air
    # 武器のデータ書き換え
        item modify entity @s weapon.offhand [{"function": "minecraft:set_name","entity": "this","target": "custom_name","name": ""},{function:set_custom_data,tag:{IsDrawing:1b,IsMhdpWeapon:1b,IsSubWeapon:1b,IsUsing:1b}},{function: set_components, components:{custom_model_data:1,hide_tooltip:{}}}]

# ステータス設定
    function mhdp_items:weapons/bow/util/set_status