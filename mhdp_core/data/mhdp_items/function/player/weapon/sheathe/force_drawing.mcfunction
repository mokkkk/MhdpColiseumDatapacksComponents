#> mhdp_items:player/weapon/sheathe/force_drawing
#
# 強制抜刀
#
# @within function mhdp_items:player/weapon/sheathe/main

# 武器消去
    clear @s ender_eye[custom_data~{IsMhdpWeapon:1b}]

# メインハンドが空でない場合、メインハンドのアイテムを退避
    execute if items entity @s weapon.mainhand * run tag @s add Ply.Temp.NoItemsInOffhand
    execute if entity @s[tag=Ply.Temp.NoItemsInOffhand] run item replace block 0 0 0 container.1 from entity @s weapon.mainhand

# アイテムの用意
    item replace block 0 0 0 container.0 with ender_eye

# 武器を強制抜刀状態にする
    data modify block 0 0 0 Items[{Slot:0b}].components set from storage mhdp_core:temp PlayerData.Item.UsingWeapon.components
    # 武器装備
        item replace entity @s weapon.mainhand from block 0 0 0 container.0
        item replace block 0 0 0 container.0 with air

# 武器のデータ書き換え
    scoreboard players set #mhdp_arg_cmd_offset MhdpCore 1
    data modify storage mhdp_core:temp Args.Slot set value "mainhand"
    function mhdp_items:core/util/item_modify_draw

# メインハンドのアイテムを戻す
    execute if entity @s[tag=Ply.Temp.NoItemsInOffhand] run loot give @s mine 0 0 0 debug_stick
    tag @s remove Ply.Temp.NoItemsInOffhand

# 終了
    item replace block 0 0 0 container.1 with air

# 各武器の抜刀処理実行
    function mhdp_items:core/switch/weapon_normal_drawing

# タグ更新
    tag @s add Ply.Weapon.Drawing

# データの取得し直し
    data modify storage mhdp_core:temp TempPlayerData set from entity @s
    function mhdp_core:player/data/items/get_data_items
    function mhdp_core:player/data/save_data
    data remove storage mhdp_core:temp TempPlayerData

# デバッグ用
    execute if data storage mhdp_core:game_data {ShowDebugMessage:true} run say 武器共通：強制抜刀