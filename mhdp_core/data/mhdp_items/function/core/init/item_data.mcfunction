#> mhdp_items:core/init/item_data
#
# アイテムデータの初期化を行う
#
# @within function mhdp_items:load

# 初期化
    data modify storage mhdp_core:game_data ItemList set value []

# 回復薬
    data modify storage mhdp_core:game_data ItemList append value {Id:"Potion",Prefix:"potion"}

# 回復薬グレート
    data modify storage mhdp_core:game_data ItemList append value {Id:"MegaPotion",Prefix:"mega_potion"}

# 秘薬
    data modify storage mhdp_core:game_data ItemList append value {Id:"MaxPotion",Prefix:"max_potion"}

say アイテムデータ初期化