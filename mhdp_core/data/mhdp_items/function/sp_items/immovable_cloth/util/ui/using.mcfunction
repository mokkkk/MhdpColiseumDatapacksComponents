#> mhdp_items:sp_items/immovable_cloth/using/util/ui
#
# 特殊装具のUI描画処理
#
# @within function mhdp_items:core/switch/item/ui

# 特殊装具のUI描画処理
    execute if score @s Itm.ImmovableCloth.GeneralTimer matches 1576.. run data modify storage mhdp_core:temp UI.ItemTemp append value [{"text":"2","font":"ui/sp_item/immovable_cloth/using"}]
    execute if score @s Itm.ImmovableCloth.GeneralTimer matches 1351..1575 run data modify storage mhdp_core:temp UI.ItemTemp append value [{"text":"3","font":"ui/sp_item/immovable_cloth/using"}]
    execute if score @s Itm.ImmovableCloth.GeneralTimer matches 1126..1350 run data modify storage mhdp_core:temp UI.ItemTemp append value [{"text":"4","font":"ui/sp_item/immovable_cloth/using"}]
    execute if score @s Itm.ImmovableCloth.GeneralTimer matches 901..1125 run data modify storage mhdp_core:temp UI.ItemTemp append value [{"text":"5","font":"ui/sp_item/immovable_cloth/using"}]
    execute if score @s Itm.ImmovableCloth.GeneralTimer matches 676..900 run data modify storage mhdp_core:temp UI.ItemTemp append value [{"text":"6","font":"ui/sp_item/immovable_cloth/using"}]
    execute if score @s Itm.ImmovableCloth.GeneralTimer matches 451..675 run data modify storage mhdp_core:temp UI.ItemTemp append value [{"text":"7","font":"ui/sp_item/immovable_cloth/using"}]
    execute if score @s Itm.ImmovableCloth.GeneralTimer matches 226..450 run data modify storage mhdp_core:temp UI.ItemTemp append value [{"text":"8","font":"ui/sp_item/immovable_cloth/using"}]
    execute if score @s Itm.ImmovableCloth.GeneralTimer matches ..225 run data modify storage mhdp_core:temp UI.ItemTemp append value [{"text":"9","font":"ui/sp_item/immovable_cloth/using"}]
