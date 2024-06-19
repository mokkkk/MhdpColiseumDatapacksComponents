#> mhdp_items:core/switch/item/use
# 
# 分岐処理 特殊装具の使用時処理
#
# @within function mhdp_core:phase/2_village_to_quest/change_phase/setup/player/sp_items

# 所持しているアイテムの名前を取得
    data modify storage mhdp_core:temp Temp.Prefix set from storage mhdp_core:temp PlayerData.Item.Mainhand.components."minecraft:custom_data".ItemName

# 分岐処理
    function mhdp_items:core/switch/item/macro/m.use with storage mhdp_core:temp Temp
    data remove storage mhdp_core:temp Temp
