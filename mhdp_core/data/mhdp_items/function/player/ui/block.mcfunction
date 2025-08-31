#> mhdp_items:player/ui/block
#
# UI処理
#
# @within function mhdp_core:player/tick

# アニメーション
    execute if score @s Ply.Timer.BuildGaugeAnimation matches 1.. run scoreboard players remove @s Ply.Timer.BuildGaugeAnimation 1

# ブロック表示
    execute if score @s Ply.Timer.BuildGaugeAnimation matches ..0 run data modify storage mhdp_core:temp UI.Block set value {"text":"0","font":"ui/new_player_ui/block",shadow_color:[0,0,0,0]}
    execute if score @s Ply.Timer.BuildGaugeAnimation matches 1 run data modify storage mhdp_core:temp UI.Block set value {"text":"1","font":"ui/new_player_ui/block",shadow_color:[0,0,0,0]}
    execute if score @s Ply.Timer.BuildGaugeAnimation matches 2.. run data modify storage mhdp_core:temp UI.Block set value {"text":"3","font":"ui/new_player_ui/block",shadow_color:[0,0,0,0]}
