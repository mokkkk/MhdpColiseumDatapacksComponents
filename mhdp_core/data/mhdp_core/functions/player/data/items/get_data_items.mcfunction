#> mhdp_core:player/data/items/get_data_items
#
# playerのデータ取得処理、武器操作用
#
# @within function mhdp_core:player/data/get_data

# 前tickのメインハンド
    execute unless data storage mhdp_core:temp PlayerData.Item.Mainhand run data remove storage mhdp_core:temp PlayerData.Item.Mainhand.Pre
    execute if data storage mhdp_core:temp PlayerData.Item.Mainhand run data modify storage mhdp_core:temp PlayerData.Item.Mainhand.Pre set from storage mhdp_core:temp PlayerData.Item.Mainhand

# 現tickのメインハンド
    execute unless items entity @s weapon.mainhand * run data remove storage mhdp_core:temp PlayerData.Item.Mainhand
    execute if items entity @s weapon.mainhand * run data modify storage mhdp_core:temp PlayerData.Item.Mainhand set from storage mhdp_core:temp TempPlayerData.SelectedItem

# 現tickのオフハンド
    execute unless items entity @s weapon.offhand * run data remove storage mhdp_core:temp PlayerData.Item.Offhand
    execute if items entity @s weapon.offhand * run data modify storage mhdp_core:temp PlayerData.Item.Offhand set from storage mhdp_core:temp TempPlayerData.Inventory[{Slot:-106b}]

# 前tickのPos
    data modify storage mhdp_core:temp PlayerData.Pos.Pre set from storage mhdp_core:temp PlayerData.Pos

# 現tickのPos
    data modify storage mhdp_core:temp PlayerData.Pos set from storage mhdp_core:temp TempPlayerData.Pos

# UsingWeaponの更新
    execute if data storage mhdp_core:temp PlayerData.Item.Mainhand.components."minecraft:custom_data"{IsMhdpWeapon:1b,IsSubWeapon:0b} run data modify storage mhdp_core:temp PlayerData.Item.UsingWeapon set from storage mhdp_core:temp PlayerData.Item.Mainhand
    execute if data storage mhdp_core:temp PlayerData.Item.Offhand.components."minecraft:custom_data"{IsMhdpWeapon:1b,IsSubWeapon:0b} run data modify storage mhdp_core:temp PlayerData.Item.UsingWeapon set from storage mhdp_core:temp PlayerData.Item.Offhand

# TODO: 以下デバッグ用のためいつか消す
    execute if score @s Ply.Uid matches 1 run data modify storage mhdp_core:temp Test set from storage mhdp_core:temp PlayerData.Item.UsingWeapon