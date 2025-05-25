#> mhdp_items:core/switch/item/drop
# 
# 分岐処理 特殊装具の投げ捨て時処理
#
# @within function mhdp_core:phase/2_village_to_quest/change_phase/setup/player/sp_items

# # 所持しているアイテムの名前を取得
#     data modify storage mhdp_core:temp Temp.Prefix set from storage mhdp_core:temp PlayerData.Item.Mainhand.components."minecraft:custom_data".ItemName

# # 分岐処理
#     function mhdp_items:core/switch/item/macro/m.drop with storage mhdp_core:temp Temp
#     data remove storage mhdp_core:temp Temp

# 不動の装衣
    execute if entity @s[tag=Itm.Sp.ImmovableCloth] run function mhdp_items:sp_items/immovable_cloth/util/drop
# 翔蟲
    execute if entity @s[tag=Itm.Sp.Wirebug] run function mhdp_items:sp_items/wirebug/util/drop

# デバッグ用メッセージ
    execute if data storage mhdp_core:game_data {ShowDebugMessage:true} run say 特殊装具投げ捨て