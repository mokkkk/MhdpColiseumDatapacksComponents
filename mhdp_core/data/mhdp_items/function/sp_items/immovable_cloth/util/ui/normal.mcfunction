#> mhdp_items:sp_items/immovable_cloth/cooltime/util/ui/normal
#
# 特殊装具のUI描画処理
#
# @within function mhdp_items:core/switch/item/ui

# 特殊装具のUI描画処理
    execute if score @s Itm.ImmovableCloth.CoolTime matches 6201.. run data modify storage mhdp_core:temp UI.ItemTemp append value [{"text":"0","font":"ui/sp_item/immovable_cloth/cooltime"}]
    execute if score @s Itm.ImmovableCloth.CoolTime matches 5401..6200 run data modify storage mhdp_core:temp UI.ItemTemp append value [{"text":"1","font":"ui/sp_item/immovable_cloth/cooltime"}]
    execute if score @s Itm.ImmovableCloth.CoolTime matches 4601..5400 run data modify storage mhdp_core:temp UI.ItemTemp append value [{"text":"2","font":"ui/sp_item/immovable_cloth/cooltime"}]
    execute if score @s Itm.ImmovableCloth.CoolTime matches 3801..4600 run data modify storage mhdp_core:temp UI.ItemTemp append value [{"text":"3","font":"ui/sp_item/immovable_cloth/cooltime"}]
    execute if score @s Itm.ImmovableCloth.CoolTime matches 3001..3800 run data modify storage mhdp_core:temp UI.ItemTemp append value [{"text":"4","font":"ui/sp_item/immovable_cloth/cooltime"}]
    execute if score @s Itm.ImmovableCloth.CoolTime matches 2201..3000 run data modify storage mhdp_core:temp UI.ItemTemp append value [{"text":"5","font":"ui/sp_item/immovable_cloth/cooltime"}]
    execute if score @s Itm.ImmovableCloth.CoolTime matches 1601..2200 run data modify storage mhdp_core:temp UI.ItemTemp append value [{"text":"6","font":"ui/sp_item/immovable_cloth/cooltime"}]
    execute if score @s Itm.ImmovableCloth.CoolTime matches 801..1600 run data modify storage mhdp_core:temp UI.ItemTemp append value [{"text":"7","font":"ui/sp_item/immovable_cloth/cooltime"}]
    execute if score @s Itm.ImmovableCloth.CoolTime matches 1..800 run data modify storage mhdp_core:temp UI.ItemTemp append value [{"text":"8","font":"ui/sp_item/immovable_cloth/cooltime"}]
    execute if score @s Itm.ImmovableCloth.CoolTime matches ..0 run data modify storage mhdp_core:temp UI.ItemTemp append value [{"text":"9","font":"ui/sp_item/immovable_cloth/cooltime"}]
