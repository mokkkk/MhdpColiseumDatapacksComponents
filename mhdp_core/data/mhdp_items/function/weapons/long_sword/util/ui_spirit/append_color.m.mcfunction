#> mhdp_items:weapons/lance/util/ui_rage/append_color.m
#
# 武器のUI描画処理
#
# @within function mhdp_items:core/switch/macro/m.ui

# 値を入れる
    $execute if score #mhdp_temp_gauge MhdpCore matches ..0 run data modify storage mhdp_core:temp UI.ColorArray append value [{"text":"0","font":"ui/weapon/long_sword/spirit_color/$(Color)/gauge_$(Type)","shadow_color":[0,0,0,0]},{"text":"\uF801","font":"space"}]
    $execute if score #mhdp_temp_gauge MhdpCore matches 1..13 run data modify storage mhdp_core:temp UI.ColorArray append value [{"text":"1","font":"ui/weapon/long_sword/spirit_color/$(Color)/gauge_$(Type)","shadow_color":[0,0,0,0]},{"text":"\uF801","font":"space"}]
    $execute if score #mhdp_temp_gauge MhdpCore matches 14..26 run data modify storage mhdp_core:temp UI.ColorArray append value [{"text":"2","font":"ui/weapon/long_sword/spirit_color/$(Color)/gauge_$(Type)","shadow_color":[0,0,0,0]},{"text":"\uF801","font":"space"}]
    $execute if score #mhdp_temp_gauge MhdpCore matches 27..39 run data modify storage mhdp_core:temp UI.ColorArray append value [{"text":"3","font":"ui/weapon/long_sword/spirit_color/$(Color)/gauge_$(Type)","shadow_color":[0,0,0,0]},{"text":"\uF801","font":"space"}]
    $execute if score #mhdp_temp_gauge MhdpCore matches 40..53 run data modify storage mhdp_core:temp UI.ColorArray append value [{"text":"4","font":"ui/weapon/long_sword/spirit_color/$(Color)/gauge_$(Type)","shadow_color":[0,0,0,0]},{"text":"\uF801","font":"space"}]
    $execute if score #mhdp_temp_gauge MhdpCore matches 54..66 run data modify storage mhdp_core:temp UI.ColorArray append value [{"text":"5","font":"ui/weapon/long_sword/spirit_color/$(Color)/gauge_$(Type)","shadow_color":[0,0,0,0]},{"text":"\uF801","font":"space"}]
    $execute if score #mhdp_temp_gauge MhdpCore matches 67..79 run data modify storage mhdp_core:temp UI.ColorArray append value [{"text":"6","font":"ui/weapon/long_sword/spirit_color/$(Color)/gauge_$(Type)","shadow_color":[0,0,0,0]},{"text":"\uF801","font":"space"}]
    $execute if score #mhdp_temp_gauge MhdpCore matches 80..92 run data modify storage mhdp_core:temp UI.ColorArray append value [{"text":"7","font":"ui/weapon/long_sword/spirit_color/$(Color)/gauge_$(Type)","shadow_color":[0,0,0,0]},{"text":"\uF801","font":"space"}]
    $execute if score #mhdp_temp_gauge MhdpCore matches 93..106 run data modify storage mhdp_core:temp UI.ColorArray append value [{"text":"8","font":"ui/weapon/long_sword/spirit_color/$(Color)/gauge_$(Type)","shadow_color":[0,0,0,0]},{"text":"\uF801","font":"space"}]
    $execute if score #mhdp_temp_gauge MhdpCore matches 107..119 run data modify storage mhdp_core:temp UI.ColorArray append value [{"text":"9","font":"ui/weapon/long_sword/spirit_color/$(Color)/gauge_$(Type)","shadow_color":[0,0,0,0]},{"text":"\uF801","font":"space"}]
    $execute if score #mhdp_temp_gauge MhdpCore matches 120..132 run data modify storage mhdp_core:temp UI.ColorArray append value [{"text":"a","font":"ui/weapon/long_sword/spirit_color/$(Color)/gauge_$(Type)","shadow_color":[0,0,0,0]},{"text":"\uF801","font":"space"}]
    $execute if score #mhdp_temp_gauge MhdpCore matches 133..145 run data modify storage mhdp_core:temp UI.ColorArray append value [{"text":"b","font":"ui/weapon/long_sword/spirit_color/$(Color)/gauge_$(Type)","shadow_color":[0,0,0,0]},{"text":"\uF801","font":"space"}]
    $execute if score #mhdp_temp_gauge MhdpCore matches 146..159 run data modify storage mhdp_core:temp UI.ColorArray append value [{"text":"c","font":"ui/weapon/long_sword/spirit_color/$(Color)/gauge_$(Type)","shadow_color":[0,0,0,0]},{"text":"\uF801","font":"space"}]
    $execute if score #mhdp_temp_gauge MhdpCore matches 160..172 run data modify storage mhdp_core:temp UI.ColorArray append value [{"text":"d","font":"ui/weapon/long_sword/spirit_color/$(Color)/gauge_$(Type)","shadow_color":[0,0,0,0]},{"text":"\uF801","font":"space"}]
    $execute if score #mhdp_temp_gauge MhdpCore matches 173..185 run data modify storage mhdp_core:temp UI.ColorArray append value [{"text":"e","font":"ui/weapon/long_sword/spirit_color/$(Color)/gauge_$(Type)","shadow_color":[0,0,0,0]},{"text":"\uF801","font":"space"}]
    $execute if score #mhdp_temp_gauge MhdpCore matches 186..200 run data modify storage mhdp_core:temp UI.ColorArray append value [{"text":"f","font":"ui/weapon/long_sword/spirit_color/$(Color)/gauge_$(Type)","shadow_color":[0,0,0,0]},{"text":"\uF801","font":"space"}]
    $execute if score #mhdp_temp_gauge MhdpCore matches 201.. run data modify storage mhdp_core:temp UI.ColorArray append value [{"text":"g","font":"ui/weapon/long_sword/spirit_color/$(Color)/gauge_$(Type)","shadow_color":[0,0,0,0]},{"text":"\uF801","font":"space"}]
