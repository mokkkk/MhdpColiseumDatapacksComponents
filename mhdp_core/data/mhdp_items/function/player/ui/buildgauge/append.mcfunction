#> mhdp_items:player/ui/buildgauge/append
#
# UI表示処理等 建材ゲージ関連 再起処理
#

# 値を入れる
    execute if score #mhdp_temp_buildgauge MhdpCore matches ..12 run data modify storage mhdp_core:temp UI.BuildGaugeArray append value [{"text":"0","font":"ui/new_player_ui/buildgauge","shadow_color":[0,0,0,0]},{"text": "\uF801","font": "space"}]
    execute if score #mhdp_temp_buildgauge MhdpCore matches 13..24 run data modify storage mhdp_core:temp UI.BuildGaugeArray append value [{"text":"1","font":"ui/new_player_ui/buildgauge","shadow_color":[0,0,0,0]},{"text": "\uF801","font": "space"}]
    execute if score #mhdp_temp_buildgauge MhdpCore matches 25..36 run data modify storage mhdp_core:temp UI.BuildGaugeArray append value [{"text":"2","font":"ui/new_player_ui/buildgauge","shadow_color":[0,0,0,0]},{"text": "\uF801","font": "space"}]
    execute if score #mhdp_temp_buildgauge MhdpCore matches 37..48 run data modify storage mhdp_core:temp UI.BuildGaugeArray append value [{"text":"3","font":"ui/new_player_ui/buildgauge","shadow_color":[0,0,0,0]},{"text": "\uF801","font": "space"}]
    execute if score #mhdp_temp_buildgauge MhdpCore matches 49..60 run data modify storage mhdp_core:temp UI.BuildGaugeArray append value [{"text":"4","font":"ui/new_player_ui/buildgauge","shadow_color":[0,0,0,0]},{"text": "\uF801","font": "space"}]
    execute if score #mhdp_temp_buildgauge MhdpCore matches 61..72 run data modify storage mhdp_core:temp UI.BuildGaugeArray append value [{"text":"5","font":"ui/new_player_ui/buildgauge","shadow_color":[0,0,0,0]},{"text": "\uF801","font": "space"}]
    execute if score #mhdp_temp_buildgauge MhdpCore matches 73..84 run data modify storage mhdp_core:temp UI.BuildGaugeArray append value [{"text":"6","font":"ui/new_player_ui/buildgauge","shadow_color":[0,0,0,0]},{"text": "\uF801","font": "space"}]
    execute if score #mhdp_temp_buildgauge MhdpCore matches 85..96 run data modify storage mhdp_core:temp UI.BuildGaugeArray append value [{"text":"7","font":"ui/new_player_ui/buildgauge","shadow_color":[0,0,0,0]},{"text": "\uF801","font": "space"}]
    execute if score #mhdp_temp_buildgauge MhdpCore matches 97..108 run data modify storage mhdp_core:temp UI.BuildGaugeArray append value [{"text":"8","font":"ui/new_player_ui/buildgauge","shadow_color":[0,0,0,0]},{"text": "\uF801","font": "space"}]
    execute if score #mhdp_temp_buildgauge MhdpCore matches 109..124 run data modify storage mhdp_core:temp UI.BuildGaugeArray append value [{"text":"9","font":"ui/new_player_ui/buildgauge","shadow_color":[0,0,0,0]},{"text": "\uF801","font": "space"}]
    execute if score #mhdp_temp_buildgauge MhdpCore matches 125.. run data modify storage mhdp_core:temp UI.BuildGaugeArray append value [{"text":"#","font":"ui/new_player_ui/buildgauge","shadow_color":[0,0,0,0]},{"text": "\uF801","font": "space"}]
