#> mhdp_items:core/switch/item/reset
# 
# 分岐処理 特殊装具のリセット処理
#
# @within function mhdp_core:phase/3_quest/change_phase/general/player/reset

# 分岐処理
    execute if data storage mhdp_core:temp PlayerData.SpItems[0] run data modify storage mhdp_core:temp Temp.Prefix set from storage mhdp_core:temp PlayerData.SpItems[0]
    execute if data storage mhdp_core:temp PlayerData.SpItems[0] run function mhdp_items:core/switch/item/macro/m.reset with storage mhdp_core:temp Temp
    data remove storage mhdp_core:temp Temp
    execute if data storage mhdp_core:temp PlayerData.SpItems[1] run data modify storage mhdp_core:temp Temp.Prefix set from storage mhdp_core:temp PlayerData.SpItems[1]
    execute if data storage mhdp_core:temp PlayerData.SpItems[1] run function mhdp_items:core/switch/item/macro/m.reset with storage mhdp_core:temp Temp
    data remove storage mhdp_core:temp Temp
    

# データ消去
    data modify storage mhdp_core:temp PlayerData.SpItems set value []

# 反映
    function mhdp_core:player/data/save_data
