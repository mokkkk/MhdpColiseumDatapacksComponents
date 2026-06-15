#> mhdp_items:weapons/lance/util/ui_rage/append_spirit.m
#
# 武器のUI描画処理
#
# @within function mhdp_items:core/switch/macro/m.ui

# 値を入れる
    $execute if score #mhdp_temp_gauge MhdpCore matches ..27 run data modify storage mhdp_core:temp UI.SpiritArray append value [{"text":"0","font":"ui/weapon/long_sword/$(Color)/gauge_$(Type)","color":"red","shadow_color":[0,0,0,0]},{"text":"\uF801","font":"space"}]
    $execute if score #mhdp_temp_gauge MhdpCore matches 28..55 run data modify storage mhdp_core:temp UI.SpiritArray append value [{"text":"1","font":"ui/weapon/long_sword/$(Color)/gauge_$(Type)","color":"red","shadow_color":[0,0,0,0]},{"text":"\uF801","font":"space"}]
    $execute if score #mhdp_temp_gauge MhdpCore matches 56..83 run data modify storage mhdp_core:temp UI.SpiritArray append value [{"text":"2","font":"ui/weapon/long_sword/$(Color)/gauge_$(Type)","color":"red","shadow_color":[0,0,0,0]},{"text":"\uF801","font":"space"}]
    $execute if score #mhdp_temp_gauge MhdpCore matches 84..111 run data modify storage mhdp_core:temp UI.SpiritArray append value [{"text":"3","font":"ui/weapon/long_sword/$(Color)/gauge_$(Type)","color":"red","shadow_color":[0,0,0,0]},{"text":"\uF801","font":"space"}]
    $execute if score #mhdp_temp_gauge MhdpCore matches 112..139 run data modify storage mhdp_core:temp UI.SpiritArray append value [{"text":"4","font":"ui/weapon/long_sword/$(Color)/gauge_$(Type)","color":"red","shadow_color":[0,0,0,0]},{"text":"\uF801","font":"space"}]
    $execute if score #mhdp_temp_gauge MhdpCore matches 140..167 run data modify storage mhdp_core:temp UI.SpiritArray append value [{"text":"5","font":"ui/weapon/long_sword/$(Color)/gauge_$(Type)","color":"red","shadow_color":[0,0,0,0]},{"text":"\uF801","font":"space"}]
    $execute if score #mhdp_temp_gauge MhdpCore matches 168..195 run data modify storage mhdp_core:temp UI.SpiritArray append value [{"text":"6","font":"ui/weapon/long_sword/$(Color)/gauge_$(Type)","color":"red","shadow_color":[0,0,0,0]},{"text":"\uF801","font":"space"}]
    $execute if score #mhdp_temp_gauge MhdpCore matches 196..223 run data modify storage mhdp_core:temp UI.SpiritArray append value [{"text":"7","font":"ui/weapon/long_sword/$(Color)/gauge_$(Type)","color":"red","shadow_color":[0,0,0,0]},{"text":"\uF801","font":"space"}]
    $execute if score #mhdp_temp_gauge MhdpCore matches 224..251 run data modify storage mhdp_core:temp UI.SpiritArray append value [{"text":"8","font":"ui/weapon/long_sword/$(Color)/gauge_$(Type)","color":"red","shadow_color":[0,0,0,0]},{"text":"\uF801","font":"space"}]
    $execute if score #mhdp_temp_gauge MhdpCore matches 252..279 run data modify storage mhdp_core:temp UI.SpiritArray append value [{"text":"9","font":"ui/weapon/long_sword/$(Color)/gauge_$(Type)","color":"red","shadow_color":[0,0,0,0]},{"text":"\uF801","font":"space"}]
    $execute if score #mhdp_temp_gauge MhdpCore matches 280..306 run data modify storage mhdp_core:temp UI.SpiritArray append value [{"text":"a","font":"ui/weapon/long_sword/$(Color)/gauge_$(Type)","color":"red","shadow_color":[0,0,0,0]},{"text":"\uF801","font":"space"}]
    $execute if score #mhdp_temp_gauge MhdpCore matches 307.. run data modify storage mhdp_core:temp UI.SpiritArray append value [{"text":"b","font":"ui/weapon/long_sword/$(Color)/gauge_$(Type)","color":"red","shadow_color":[0,0,0,0]},{"text":"\uF801","font":"space"}]
