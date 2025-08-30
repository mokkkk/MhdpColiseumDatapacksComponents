#> mhdp_items:player/ui/arts_1/append_using_1
#
# UI表示処理等 スタミナ関連 再起処理
#

# 点滅
    execute if score #mhdp_core_tick MhdpCore matches ..3 run return run function mhdp_items:player/ui/arts/append_using_white_1
    execute if score #mhdp_core_tick MhdpCore matches 8..12 run return run function mhdp_items:player/ui/arts/append_using_white_1
    execute if score #mhdp_core_tick MhdpCore matches 17.. run return run function mhdp_items:player/ui/arts/append_using_white_1

# 値を入れる
    execute if score #mhdp_temp_arts MhdpCore matches ..19 run data modify storage mhdp_core:temp UI.ArtsArray1 append value [{"text":"0","font":"ui/new_player_ui/arts/charge","shadow_color":[0,0,0,0]},{"text": "\uF801","font": "space"}]
    execute if score #mhdp_temp_arts MhdpCore matches 20..39 run data modify storage mhdp_core:temp UI.ArtsArray1 append value [{"text":"1","font":"ui/new_player_ui/arts/charge","shadow_color":[0,0,0,0]},{"text": "\uF801","font": "space"}]
    execute if score #mhdp_temp_arts MhdpCore matches 40..59 run data modify storage mhdp_core:temp UI.ArtsArray1 append value [{"text":"2","font":"ui/new_player_ui/arts/charge","shadow_color":[0,0,0,0]},{"text": "\uF801","font": "space"}]
    execute if score #mhdp_temp_arts MhdpCore matches 60..79 run data modify storage mhdp_core:temp UI.ArtsArray1 append value [{"text":"3","font":"ui/new_player_ui/arts/charge","shadow_color":[0,0,0,0]},{"text": "\uF801","font": "space"}]
    execute if score #mhdp_temp_arts MhdpCore matches 80..99 run data modify storage mhdp_core:temp UI.ArtsArray1 append value [{"text":"4","font":"ui/new_player_ui/arts/charge","shadow_color":[0,0,0,0]},{"text": "\uF801","font": "space"}]
    execute if score #mhdp_temp_arts MhdpCore matches 100.. run data modify storage mhdp_core:temp UI.ArtsArray1 append value [{"text":"5","font":"ui/new_player_ui/arts/charge","shadow_color":[0,0,0,0]},{"text": "\uF801","font": "space"}]

# # 値を入れる
#     execute if score #mhdp_temp_arts MhdpCore matches ..9 run data modify storage mhdp_core:temp UI.ArtsArray1 append value [{"text":"f","font":"ui/arts_1"},{"text": "\uF801","font": "space"}]
#     execute if score #mhdp_temp_arts MhdpCore matches 10..19 run data modify storage mhdp_core:temp UI.ArtsArray1 append value [{"text":"g","font":"ui/arts_1"},{"text": "\uF801","font": "space"}]
#     execute if score #mhdp_temp_arts MhdpCore matches 20..29 run data modify storage mhdp_core:temp UI.ArtsArray1 append value [{"text":"h","font":"ui/arts_1"},{"text": "\uF801","font": "space"}]
#     execute if score #mhdp_temp_arts MhdpCore matches 30..39 run data modify storage mhdp_core:temp UI.ArtsArray1 append value [{"text":"i","font":"ui/arts_1"},{"text": "\uF801","font": "space"}]
#     execute if score #mhdp_temp_arts MhdpCore matches 40..49 run data modify storage mhdp_core:temp UI.ArtsArray1 append value [{"text":"j","font":"ui/arts_1"},{"text": "\uF801","font": "space"}]
#     execute if score #mhdp_temp_arts MhdpCore matches 50..59 run data modify storage mhdp_core:temp UI.ArtsArray1 append value [{"text":"k","font":"ui/arts_1"},{"text": "\uF801","font": "space"}]
#     execute if score #mhdp_temp_arts MhdpCore matches 60..69 run data modify storage mhdp_core:temp UI.ArtsArray1 append value [{"text":"l","font":"ui/arts_1"},{"text": "\uF801","font": "space"}]
#     execute if score #mhdp_temp_arts MhdpCore matches 70..79 run data modify storage mhdp_core:temp UI.ArtsArray1 append value [{"text":"m","font":"ui/arts_1"},{"text": "\uF801","font": "space"}]
#     execute if score #mhdp_temp_arts MhdpCore matches 80..89 run data modify storage mhdp_core:temp UI.ArtsArray1 append value [{"text":"n","font":"ui/arts_1"},{"text": "\uF801","font": "space"}]
#     execute if score #mhdp_temp_arts MhdpCore matches 90..99 run data modify storage mhdp_core:temp UI.ArtsArray1 append value [{"text":"o","font":"ui/arts_1"},{"text": "\uF801","font": "space"}]
#     execute if score #mhdp_temp_arts MhdpCore matches 100.. run data modify storage mhdp_core:temp UI.ArtsArray1 append value [{"text":"p","font":"ui/arts_1"},{"text": "\uF801","font": "space"}]
