#> mhdp_items:items/using
#
# アイテム使用時の共通処理
#
# @within function mhdp_items:/**

# 各アイテムのfunctionに移行 
    data modify storage mhdp_core:temp Temp.ItemName set from entity @s SelectedItem.components."minecraft:custom_data".ItemName
    function mhdp_items:items/macro/m.get_using_function with storage mhdp_core:temp Temp
    data remove storage mhdp_core:temp Temp
