#> mhdp_core:player/data/items/get_data_items
#
# playerのデータ取得処理、アイテム処理用
#
# @within function mhdp_core:player/data/get_data

# 前tickのメインハンド
    execute unless data storage mhdp_core:temp PlayerData.Item.Mainhand run data remove storage mhdp_core:temp PlayerData.Item.Mainhand.Pre
    execute if data storage mhdp_core:temp PlayerData.Item.Mainhand run data modify storage mhdp_core:temp PlayerData.Item.Mainhand.Pre set from storage mhdp_core:temp PlayerData.Item.Mainhand

# 現tickのメインハンド
    execute unless data storage mhdp_core:temp TempPlayerData.SelectedItem run data remove storage mhdp_core:temp PlayerData.Item.Mainhand
    execute if data storage mhdp_core:temp TempPlayerData.SelectedItem run data modify storage mhdp_core:temp PlayerData.Item.Mainhand set from storage mhdp_core:temp TempPlayerData.SelectedItem

# 現tickのオフハンド
    execute unless data storage mhdp_core:temp TempPlayerData.Inventory[{Slot:-106b}] run data remove storage mhdp_core:temp PlayerData.Item.Offhand
    execute if data storage mhdp_core:temp TempPlayerData.Inventory[{Slot:-106b}] run data modify storage mhdp_core:temp PlayerData.Item.Offhand set from storage mhdp_core:temp TempPlayerData.Inventory[{Slot:-106b}]

# 前tickのPos
    data modify storage mhdp_core:temp PlayerData.Pos.Pre set from storage mhdp_core:temp PlayerData.Pos

# 現tickのPos
    data modify storage mhdp_core:temp PlayerData.Pos set from storage mhdp_core:temp TempPlayerData.Pos
