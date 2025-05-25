#> mhdp_items:core/switch/item/ui
# 
# 分岐処理 特殊装具のUI描画処理
#
# @within function mhdp_items:/**

# TODO: 分岐処理
    # say TODO:特殊装具のUI描画処理

# 分岐処理
    execute if data storage mhdp_core:temp PlayerData.SpItems[0] run data modify storage mhdp_core:temp Temp.Prefix set from storage mhdp_core:temp PlayerData.SpItems[0]
    execute if data storage mhdp_core:temp PlayerData.SpItems[0] run function mhdp_items:core/switch/item/macro/m.ui with storage mhdp_core:temp Temp
    data remove storage mhdp_core:temp Temp
    execute if data storage mhdp_core:temp PlayerData.SpItems[1] run data modify storage mhdp_core:temp Temp.Prefix set from storage mhdp_core:temp PlayerData.SpItems[1]
    execute if data storage mhdp_core:temp PlayerData.SpItems[1] run function mhdp_items:core/switch/item/macro/m.ui with storage mhdp_core:temp Temp
    data remove storage mhdp_core:temp Temp
