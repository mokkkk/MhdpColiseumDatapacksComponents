#> mhdp_items:core/switch/weapon_normal_drawing
# 
# 分岐処理 各武器の抜刀処理
#
# @within function mhdp_items:/**

# TODO: 分岐処理
    say TODO:武器の抜刀分岐処理

# 以下、テスト用のサブ武器抜刀処理
    # タグ付与
        tag @s add Ply.Weapon.Drawing.Sub
    # アイテムの用意
        item replace block 0 0 0 container.0 with ender_eye
    # サブ武器装備
        data modify block 0 0 0 Items[{Slot:0b}].components set from storage mhdp_core:temp PlayerData.Item.UsingWeapon.components
        item replace entity @s weapon.offhand from block 0 0 0 container.0
        item replace block 0 0 0 container.0 with air
    # 武器のデータ書き換え
        item modify entity @s weapon.offhand [{"function": "minecraft:set_name","entity": "this","target": "custom_name","name": "SubWeapon"},{function:set_custom_data,tag:{IsDrawing:1b,IsSubWeapon:1b}}]
