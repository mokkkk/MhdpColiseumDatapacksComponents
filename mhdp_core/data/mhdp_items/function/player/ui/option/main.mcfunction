#> mhdp_items:player/ui/option/main
#
# UI処理 斬れ味
#

# UI設定
    execute if entity @s[tag=Ply.Option.DisableMoveJump] run data modify storage mhdp_core:temp UI.Option.MoveJump set value {"text":"0","font":"ui/new_player_ui/option/movejump",shadow_color:[0,0,0,0]}
    execute if entity @s[tag=!Ply.Option.DisableMoveJump] run data modify storage mhdp_core:temp UI.Option.MoveJump set value {"text":"1","font":"ui/new_player_ui/option/movejump",shadow_color:[0,0,0,0]}
