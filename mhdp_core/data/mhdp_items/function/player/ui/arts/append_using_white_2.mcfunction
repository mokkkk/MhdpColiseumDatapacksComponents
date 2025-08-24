#> mhdp_items:player/ui/arts_2/append_using_white_2
#
# UI表示処理等 スタミナ関連 再起処理
#

# 値を入れる
    execute if score #mhdp_temp_arts MhdpCore matches ..9 run data modify storage mhdp_core:temp UI.ArtsArray2 append value [{"text":"f","font":"ui/arts_2"},{"text": "\uF801","font": "space"}]
    execute if score #mhdp_temp_arts MhdpCore matches 10..19 run data modify storage mhdp_core:temp UI.ArtsArray2 append value [{"text":"q","font":"ui/arts_2"},{"text": "\uF801","font": "space"}]
    execute if score #mhdp_temp_arts MhdpCore matches 20..29 run data modify storage mhdp_core:temp UI.ArtsArray2 append value [{"text":"r","font":"ui/arts_2"},{"text": "\uF801","font": "space"}]
    execute if score #mhdp_temp_arts MhdpCore matches 30..39 run data modify storage mhdp_core:temp UI.ArtsArray2 append value [{"text":"s","font":"ui/arts_2"},{"text": "\uF801","font": "space"}]
    execute if score #mhdp_temp_arts MhdpCore matches 40..49 run data modify storage mhdp_core:temp UI.ArtsArray2 append value [{"text":"t","font":"ui/arts_2"},{"text": "\uF801","font": "space"}]
    execute if score #mhdp_temp_arts MhdpCore matches 50..59 run data modify storage mhdp_core:temp UI.ArtsArray2 append value [{"text":"u","font":"ui/arts_2"},{"text": "\uF801","font": "space"}]
    execute if score #mhdp_temp_arts MhdpCore matches 60..69 run data modify storage mhdp_core:temp UI.ArtsArray2 append value [{"text":"v","font":"ui/arts_2"},{"text": "\uF801","font": "space"}]
    execute if score #mhdp_temp_arts MhdpCore matches 70..79 run data modify storage mhdp_core:temp UI.ArtsArray2 append value [{"text":"w","font":"ui/arts_2"},{"text": "\uF801","font": "space"}]
    execute if score #mhdp_temp_arts MhdpCore matches 80..89 run data modify storage mhdp_core:temp UI.ArtsArray2 append value [{"text":"x","font":"ui/arts_2"},{"text": "\uF801","font": "space"}]
    execute if score #mhdp_temp_arts MhdpCore matches 90..99 run data modify storage mhdp_core:temp UI.ArtsArray2 append value [{"text":"y","font":"ui/arts_2"},{"text": "\uF801","font": "space"}]
    execute if score #mhdp_temp_arts MhdpCore matches 100.. run data modify storage mhdp_core:temp UI.ArtsArray2 append value [{"text":"z","font":"ui/arts_2"},{"text": "\uF801","font": "space"}]
