#> mhdp_items:core/switch/item/init
# 
# 分岐処理 特殊装具の初期化処理
#
# @within function mhdp_core:phase/2_village_to_quest/change_phase/setup/player/sp_items

# 翔蟲
    execute if items entity @s container.* minecraft:carrot_on_a_stick[minecraft:custom_data~{IsSpItem:1b,ItemId:1001}] run function mhdp_items:sp_items/wirebug/util/init
