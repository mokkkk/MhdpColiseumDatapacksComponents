#> mhdp_items:weapons/lance/util/ui_rage/append
#
# 武器のUI描画処理
#
# @within function mhdp_items:core/switch/macro/m.ui

# 値を入れる
    execute if score #mhdp_temp_gauge MhdpCore matches ..20 run data modify storage mhdp_core:temp UI.RageArray append value [{"text":"0","font":"ui/weapon/lance/rage_2/gauge","shadow_color":[0,0,0,0]},{"text":"\uF801","font":"space"}]
    execute if score #mhdp_temp_gauge MhdpCore matches 21..40 run data modify storage mhdp_core:temp UI.RageArray append value [{"text":"1","font":"ui/weapon/lance/rage_2/gauge","shadow_color":[0,0,0,0]},{"text":"\uF801","font":"space"}]
    execute if score #mhdp_temp_gauge MhdpCore matches 41..60 run data modify storage mhdp_core:temp UI.RageArray append value [{"text":"2","font":"ui/weapon/lance/rage_2/gauge","shadow_color":[0,0,0,0]},{"text":"\uF801","font":"space"}]
    execute if score #mhdp_temp_gauge MhdpCore matches 61..80 run data modify storage mhdp_core:temp UI.RageArray append value [{"text":"3","font":"ui/weapon/lance/rage_2/gauge","shadow_color":[0,0,0,0]},{"text":"\uF801","font":"space"}]
    execute if score #mhdp_temp_gauge MhdpCore matches 81..100 run data modify storage mhdp_core:temp UI.RageArray append value [{"text":"4","font":"ui/weapon/lance/rage_2/gauge","shadow_color":[0,0,0,0]},{"text":"\uF801","font":"space"}]
    execute if score #mhdp_temp_gauge MhdpCore matches 101..120 run data modify storage mhdp_core:temp UI.RageArray append value [{"text":"5","font":"ui/weapon/lance/rage_2/gauge","shadow_color":[0,0,0,0]},{"text":"\uF801","font":"space"}]
    execute if score #mhdp_temp_gauge MhdpCore matches 121..140 run data modify storage mhdp_core:temp UI.RageArray append value [{"text":"6","font":"ui/weapon/lance/rage_2/gauge","shadow_color":[0,0,0,0]},{"text":"\uF801","font":"space"}]
    execute if score #mhdp_temp_gauge MhdpCore matches 141..160 run data modify storage mhdp_core:temp UI.RageArray append value [{"text":"7","font":"ui/weapon/lance/rage_2/gauge","shadow_color":[0,0,0,0]},{"text":"\uF801","font":"space"}]
    execute if score #mhdp_temp_gauge MhdpCore matches 161..180 run data modify storage mhdp_core:temp UI.RageArray append value [{"text":"8","font":"ui/weapon/lance/rage_2/gauge","shadow_color":[0,0,0,0]},{"text":"\uF801","font":"space"}]
    execute if score #mhdp_temp_gauge MhdpCore matches 181..199 run data modify storage mhdp_core:temp UI.RageArray append value [{"text":"9","font":"ui/weapon/lance/rage_2/gauge","shadow_color":[0,0,0,0]},{"text":"\uF801","font":"space"}]
    execute if score #mhdp_temp_gauge MhdpCore matches 200.. run data modify storage mhdp_core:temp UI.RageArray append value [{"text":"#","font":"ui/weapon/lance/rage_2/gauge","shadow_color":[0,0,0,0]},{"text":"\uF801","font":"space"}]
