#> mhdp_items:player/ui/arts_1/gauge_1
#
# UI表示処理等 スタミナ関連 再起処理
#

# 値を入れる
    execute if score @s Ply.Stats.Arts.1.Percent matches ..699 run data modify storage mhdp_core:temp UI.ArtsGauge1 append value [{"text":"a","font":"ui/new_player_ui/arts/gauge","color":"white","shadow_color":[0,0,0,0]}]
    execute if score @s Ply.Stats.Arts.1.Percent matches 700.. run data modify storage mhdp_core:temp UI.ArtsGauge1 append value [{"text":"b","font":"ui/new_player_ui/arts/gauge","color":"white","shadow_color":[0,0,0,0]}]
