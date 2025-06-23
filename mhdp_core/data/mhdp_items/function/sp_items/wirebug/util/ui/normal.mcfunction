#> mhdp_items:sp_items/wirebug/util/ui/normal
#
# 特殊装具のUI描画処理
#
# @within function mhdp_items:core/switch/item/ui

# 特殊装具のUI描画処理
    execute if score @s Itm.Wirebug.CoolTime matches 185.. run data modify storage mhdp_core:temp UI.ItemTemp append value [{"text":"0","font":"ui/sp_item/wirebug"}]
    execute if score @s Itm.Wirebug.CoolTime matches 162..184 run data modify storage mhdp_core:temp UI.ItemTemp append value [{"text":"1","font":"ui/sp_item/wirebug"}]
    execute if score @s Itm.Wirebug.CoolTime matches 139..161 run data modify storage mhdp_core:temp UI.ItemTemp append value [{"text":"2","font":"ui/sp_item/wirebug"}]
    execute if score @s Itm.Wirebug.CoolTime matches 116..138 run data modify storage mhdp_core:temp UI.ItemTemp append value [{"text":"3","font":"ui/sp_item/wirebug"}]
    execute if score @s Itm.Wirebug.CoolTime matches 93..115 run data modify storage mhdp_core:temp UI.ItemTemp append value [{"text":"4","font":"ui/sp_item/wirebug"}]
    execute if score @s Itm.Wirebug.CoolTime matches 70..92 run data modify storage mhdp_core:temp UI.ItemTemp append value [{"text":"5","font":"ui/sp_item/wirebug"}]
    execute if score @s Itm.Wirebug.CoolTime matches 47..69 run data modify storage mhdp_core:temp UI.ItemTemp append value [{"text":"6","font":"ui/sp_item/wirebug"}]
    execute if score @s Itm.Wirebug.CoolTime matches 24..46 run data modify storage mhdp_core:temp UI.ItemTemp append value [{"text":"7","font":"ui/sp_item/wirebug"}]
    execute if score @s Itm.Wirebug.CoolTime matches 1..23 run data modify storage mhdp_core:temp UI.ItemTemp append value [{"text":"8","font":"ui/sp_item/wirebug"}]
    execute if score @s Itm.Wirebug.CoolTime matches ..0 run data modify storage mhdp_core:temp UI.ItemTemp append value [{"text":"9","font":"ui/sp_item/wirebug"}]
