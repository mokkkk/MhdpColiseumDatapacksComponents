#> mhdp_items:weapons/bow/util/ui_bottle/append
#
# 武器のUI描画処理
#
# @within function mhdp_items:core/switch/macro/m.ui

# 値を入れる
    execute if score #mhdp_temp_gauge MhdpCore matches ..11 run data modify storage mhdp_core:temp UI.ExArray append value [{"text":"0","font":"ui/weapon/bow/gauge"},{"text":"\uF801","font":"space"}]
    execute if score #mhdp_temp_gauge MhdpCore matches 12..22 run data modify storage mhdp_core:temp UI.ExArray append value [{"text":"1","font":"ui/weapon/bow/gauge"},{"text":"\uF801","font":"space"}]
    execute if score #mhdp_temp_gauge MhdpCore matches 23..33 run data modify storage mhdp_core:temp UI.ExArray append value [{"text":"2","font":"ui/weapon/bow/gauge"},{"text":"\uF801","font":"space"}]
    execute if score #mhdp_temp_gauge MhdpCore matches 34..44 run data modify storage mhdp_core:temp UI.ExArray append value [{"text":"3","font":"ui/weapon/bow/gauge"},{"text":"\uF801","font":"space"}]
    execute if score #mhdp_temp_gauge MhdpCore matches 45..55 run data modify storage mhdp_core:temp UI.ExArray append value [{"text":"4","font":"ui/weapon/bow/gauge"},{"text":"\uF801","font":"space"}]
    execute if score #mhdp_temp_gauge MhdpCore matches 56..66 run data modify storage mhdp_core:temp UI.ExArray append value [{"text":"5","font":"ui/weapon/bow/gauge"},{"text":"\uF801","font":"space"}]
    execute if score #mhdp_temp_gauge MhdpCore matches 67..77 run data modify storage mhdp_core:temp UI.ExArray append value [{"text":"6","font":"ui/weapon/bow/gauge"},{"text":"\uF801","font":"space"}]
    execute if score #mhdp_temp_gauge MhdpCore matches 78..88 run data modify storage mhdp_core:temp UI.ExArray append value [{"text":"7","font":"ui/weapon/bow/gauge"},{"text":"\uF801","font":"space"}]
    execute if score #mhdp_temp_gauge MhdpCore matches 89..99 run data modify storage mhdp_core:temp UI.ExArray append value [{"text":"8","font":"ui/weapon/bow/gauge"},{"text":"\uF801","font":"space"}]
    execute if score #mhdp_temp_gauge MhdpCore matches 100.. run data modify storage mhdp_core:temp UI.ExArray append value [{"text":"9","font":"ui/weapon/bow/gauge"},{"text":"\uF801","font":"space"}]
