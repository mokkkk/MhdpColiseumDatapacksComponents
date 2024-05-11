#> mhdp_items:player/weapon/sheathe/force_sheathe
#
# 強制納刀
#
# @within function mhdp_items:player/weapon/sheathe/main

# 武器消去
    clear @s ender_eye[custom_data~{IsMhdpWeapon:1b}]

# 武器投げ捨ての場合、近くにある武器を消す
    execute if entity @s[tag=Ply.Ope.DroppedEnderEye] as @e[type=item] if items entity @s contents ender_eye[custom_data~{IsMhdpWeapon:1b,IsUsing:1b}] run kill @s

# オフハンドが空でない場合、オフハンドのアイテムを退避
    execute if items entity @s weapon.offhand * run tag @s add Ply.Temp.NoItemsInOffhand
    execute if entity @s[tag=Ply.Temp.NoItemsInOffhand] run item replace block 0 0 0 container.1 from entity @s weapon.offhand

# アイテムの用意
    item replace block 0 0 0 container.0 with ender_eye

# 武器を強制納刀状態にする
    data modify block 0 0 0 Items[{Slot:0b}].components set from storage mhdp_core:temp PlayerData.Item.UsingWeapon.components
    # 武器装備
        item replace entity @s weapon.offhand from block 0 0 0 container.0
        item replace block 0 0 0 container.0 with air

# 武器のデータ書き換え
    item modify entity @s weapon.offhand {function:set_custom_data,tag:{IsDrawing:0b}}

# オフハンドのアイテムを戻す
    execute if entity @s[tag=Ply.Temp.NoItemsInOffhand] run loot give @s mine 0 0 0 debug_stick
    tag @s remove Ply.Temp.NoItemsInOffhand

# 終了
    item replace block 0 0 0 container.1 with air

# タグ更新
    tag @s remove Ply.Flag.NormalSheathe
    tag @s remove Ply.Weapon.Drawing
    tag @s remove Ply.Weapon.Drawing.Sub

# データの取得し直し
    data modify storage mhdp_core:temp TempPlayerData set from entity @s
    function mhdp_core:player/data/items/get_data_items
    function mhdp_core:player/data/save_data
    data remove storage mhdp_core:temp TempPlayerData

say 強制納刀