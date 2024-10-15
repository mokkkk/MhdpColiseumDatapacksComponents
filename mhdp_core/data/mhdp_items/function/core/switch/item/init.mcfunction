#> mhdp_items:core/switch/item/init
# 
# 分岐処理 特殊装具の初期化処理
#
# @within function mhdp_core:phase/2_village_to_quest/change_phase/setup/player/sp_items

# 所持している特殊装具に応じてデータを設定
    data modify storage mhdp_core:temp PlayerData.SpItems set value []
    # 不動の装衣
        execute if items entity @s container.* minecraft:carrot_on_a_stick[minecraft:custom_data~{IsSpItem:1b,ItemId:1000}] run data modify storage mhdp_core:temp PlayerData.SpItems append value "immovable_cloth"
    # 翔蟲
        execute if items entity @s container.* minecraft:carrot_on_a_stick[minecraft:custom_data~{IsSpItem:1b,ItemId:1001}] run data modify storage mhdp_core:temp PlayerData.SpItems append value "wirebug"

# 分岐処理
    execute if data storage mhdp_core:temp PlayerData.SpItems[0] run data modify storage mhdp_core:temp Temp.Prefix set from storage mhdp_core:temp PlayerData.SpItems[0]
    execute if data storage mhdp_core:temp PlayerData.SpItems[0] run function mhdp_items:core/switch/item/macro/m.init with storage mhdp_core:temp Temp
    data remove storage mhdp_core:temp Temp
    execute if data storage mhdp_core:temp PlayerData.SpItems[1] run data modify storage mhdp_core:temp Temp.Prefix set from storage mhdp_core:temp PlayerData.SpItems[1]
    execute if data storage mhdp_core:temp PlayerData.SpItems[1] run function mhdp_items:core/switch/item/macro/m.init with storage mhdp_core:temp Temp
    data remove storage mhdp_core:temp Temp

# 反映
    function mhdp_core:player/data/save_data
