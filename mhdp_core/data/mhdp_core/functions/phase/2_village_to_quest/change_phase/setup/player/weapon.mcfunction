#> mhdp_core:phase/2_village_to_quest/change_phase/setup/player/weapon
#
# クエスト開始処理 プレイヤー実行 武器のセットアップ
#
# @within function mhdp_core:phase/2_village_to_quest/change_phase/setup/main

# アイテムの用意
    item replace block 0 0 0 container.0 with ender_eye

# 個別ストレージの武器データをコピー
    function mhdp_core:player/data/load_data
    data modify block 0 0 0 Items[{Slot:0b}].components set from storage mhdp_core:temp PlayerData.Item.MainWeapon.components
    # クエスト中独自のデータ付与
        data modify block 0 0 0 Items[{Slot:0b}].components."minecraft.custom_data".IsUsing set value 1b
        data modify block 0 0 0 Items[{Slot:0b}].components."minecraft.custom_data".IsSubWeapon set value 0b
        data modify block 0 0 0 Items[{Slot:0b}].components."minecraft.custom_data".IsDrawing set value 0b

# プレイヤーに渡す
    execute unless items entity @s weapon.offhand * run tag @s add Ply.Temp.NoItemsInOffhand
    # オフハンドが空でない場合、オフハンドのアイテムを退避
        execute if entity @s[tag=Ply.Temp.NoItemsInOffhand] run item replace block 0 0 0 container.1 from entity @s weapon.offhand
    item replace entity @s weapon.offhand from block 0 0 0 container.0
        execute if entity @s[tag=Ply.Temp.NoItemsInOffhand] run item replace block 0 0 0 container.0 with air
        execute if entity @s[tag=Ply.Temp.NoItemsInOffhand] run loot give @s mine 0 0 0 debug_stick
    tag @s remove Ply.Temp.NoItemsInOffhand

# 終了
    item replace block 0 0 0 container.1 with air
