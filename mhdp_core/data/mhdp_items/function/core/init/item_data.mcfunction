#> mhdp_items:core/init/item_data
#
# アイテムデータの初期化を行う
#
# @within function mhdp_items:load

# 初期化
    data modify storage mhdp_core:game_data ItemList set value []

# 1:回復薬
    data modify storage mhdp_core:game_data ItemList append value {Id:"Potion",OnUseFunction:"mhdp_items:items/switch/potion/on_use"}

say アイテムデータ初期化