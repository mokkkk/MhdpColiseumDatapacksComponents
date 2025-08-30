#> mhdp_items:player/ui/type
#
# UI処理
#
# @within function mhdp_core:player/tick

# 型表示
    execute if entity @s[tag=!Ply.Weapon.Type.Tech] run data modify storage mhdp_core:temp UI.Type set value {"text":"a","font": "ui/new_player_ui/type",shadow_color:[0,0,0,0]}
    execute if entity @s[tag=Ply.Weapon.Type.Tech] run data modify storage mhdp_core:temp UI.Type set value {"text":"b","font": "ui/new_player_ui/type",shadow_color:[0,0,0,0]}
