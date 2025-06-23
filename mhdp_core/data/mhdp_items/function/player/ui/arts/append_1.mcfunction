#> mhdp_items:player/ui/arts_1/append_1
#
# UI表示処理等 スタミナ関連 再起処理
#

# 満タンの場合
    execute if score @s Ply.Stats.Arts.1.Percent matches 600..

# 値を入れる
    execute if score #mhdp_temp_arts MhdpCore matches ..9 run data modify storage mhdp_core:temp UI.ArtsArray1 append value [{"text":"0","font":"ui/arts_1"},{"text": "\uF801","font": "space"}]
    execute if score #mhdp_temp_arts MhdpCore matches 10..19 run data modify storage mhdp_core:temp UI.ArtsArray1 append value [{"text":"1","font":"ui/arts_1"},{"text": "\uF801","font": "space"}]
    execute if score #mhdp_temp_arts MhdpCore matches 20..29 run data modify storage mhdp_core:temp UI.ArtsArray1 append value [{"text":"2","font":"ui/arts_1"},{"text": "\uF801","font": "space"}]
    execute if score #mhdp_temp_arts MhdpCore matches 30..39 run data modify storage mhdp_core:temp UI.ArtsArray1 append value [{"text":"3","font":"ui/arts_1"},{"text": "\uF801","font": "space"}]
    execute if score #mhdp_temp_arts MhdpCore matches 40..49 run data modify storage mhdp_core:temp UI.ArtsArray1 append value [{"text":"4","font":"ui/arts_1"},{"text": "\uF801","font": "space"}]
    execute if score #mhdp_temp_arts MhdpCore matches 50..59 run data modify storage mhdp_core:temp UI.ArtsArray1 append value [{"text":"5","font":"ui/arts_1"},{"text": "\uF801","font": "space"}]
    execute if score #mhdp_temp_arts MhdpCore matches 60..69 run data modify storage mhdp_core:temp UI.ArtsArray1 append value [{"text":"6","font":"ui/arts_1"},{"text": "\uF801","font": "space"}]
    execute if score #mhdp_temp_arts MhdpCore matches 70..79 run data modify storage mhdp_core:temp UI.ArtsArray1 append value [{"text":"7","font":"ui/arts_1"},{"text": "\uF801","font": "space"}]
    execute if score #mhdp_temp_arts MhdpCore matches 80..89 run data modify storage mhdp_core:temp UI.ArtsArray1 append value [{"text":"8","font":"ui/arts_1"},{"text": "\uF801","font": "space"}]
    execute if score #mhdp_temp_arts MhdpCore matches 90..99 run data modify storage mhdp_core:temp UI.ArtsArray1 append value [{"text":"9","font":"ui/arts_1"},{"text": "\uF801","font": "space"}]
    execute if score #mhdp_temp_arts MhdpCore matches 100.. run data modify storage mhdp_core:temp UI.ArtsArray1 append value [{"text":"#","font":"ui/arts_1"},{"text": "\uF801","font": "space"}]
