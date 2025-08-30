#> mhdp_items:player/ui/arts_2/append_using_2
#
# UI表示処理等 スタミナ関連 再起処理
#

# 点滅
    execute if score #mhdp_core_tick MhdpCore matches ..3 run return run function mhdp_items:player/ui/arts/append_using_white_2
    execute if score #mhdp_core_tick MhdpCore matches 8..12 run return run function mhdp_items:player/ui/arts/append_using_white_2
    execute if score #mhdp_core_tick MhdpCore matches 17.. run return run function mhdp_items:player/ui/arts/append_using_white_2

# 値を入れる
    execute if score #mhdp_temp_arts MhdpCore matches ..19 run data modify storage mhdp_core:temp UI.ArtsArray2 append value [{"text":"0","font":"ui/new_player_ui/arts/using_blue","shadow_color":[0,0,0,0]},{"text": "\uF801","font": "space"}]
    execute if score #mhdp_temp_arts MhdpCore matches 20..39 run data modify storage mhdp_core:temp UI.ArtsArray2 append value [{"text":"1","font":"ui/new_player_ui/arts/using_blue","shadow_color":[0,0,0,0]},{"text": "\uF801","font": "space"}]
    execute if score #mhdp_temp_arts MhdpCore matches 40..59 run data modify storage mhdp_core:temp UI.ArtsArray2 append value [{"text":"2","font":"ui/new_player_ui/arts/using_blue","shadow_color":[0,0,0,0]},{"text": "\uF801","font": "space"}]
    execute if score #mhdp_temp_arts MhdpCore matches 60..79 run data modify storage mhdp_core:temp UI.ArtsArray2 append value [{"text":"3","font":"ui/new_player_ui/arts/using_blue","shadow_color":[0,0,0,0]},{"text": "\uF801","font": "space"}]
    execute if score #mhdp_temp_arts MhdpCore matches 80..99 run data modify storage mhdp_core:temp UI.ArtsArray2 append value [{"text":"4","font":"ui/new_player_ui/arts/using_blue","shadow_color":[0,0,0,0]},{"text": "\uF801","font": "space"}]
    execute if score #mhdp_temp_arts MhdpCore matches 100.. run data modify storage mhdp_core:temp UI.ArtsArray2 append value [{"text":"5","font":"ui/new_player_ui/arts/using_blue","shadow_color":[0,0,0,0]},{"text": "\uF801","font": "space"}]
