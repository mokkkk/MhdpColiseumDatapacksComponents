#> mhdp_items:core/init/item_data
#
# アイテムデータの初期化を行う
#
# @within function mhdp_items:load

# 初期化
    data modify storage mhdp_core:game_data ItemList set value []

# 回復薬
    data modify storage mhdp_core:game_data ItemList append value {Id:"potion",Prefix:"potion"}

# 回復薬グレート
    data modify storage mhdp_core:game_data ItemList append value {Id:"mega_potion",Prefix:"mega_potion"}

# 秘薬
    data modify storage mhdp_core:game_data ItemList append value {Id:"max_potion",Prefix:"max_potion"}

# 生焼け肉
    data modify storage mhdp_core:game_data ItemList append value {Id:"half_cooked_meat",Prefix:"half_cooked_meat"}

# コゲ肉
    data modify storage mhdp_core:game_data ItemList append value {Id:"burnt_meat",Prefix:"burnt_meat"}

# こんがり肉
    data modify storage mhdp_core:game_data ItemList append value {Id:"cooked_meat",Prefix:"cooked_meat"}

# デバッグ用
    execute if data storage mhdp_core:game_data {ShowDebugMessage:true} run say アイテムデータ初期化
