#> mhdp_items:player/ui/arts/main_1
#
# UI表示処理等 スタミナ関連
#

# 割合取得
    scoreboard players operation @s Ply.Stats.Arts.2.Percent = @s Ply.Stats.Arts.2
    scoreboard players operation @s Ply.Stats.Arts.2.Percent *= #const_100 Const
    scoreboard players operation @s Ply.Stats.Arts.2.Percent /= @s Ply.Stats.Arts.2.Max
    scoreboard players operation @s Ply.Stats.Arts.2.Percent *= #const_7 Const

# ゲージ満タンの場合の処理
    # execute if entity @s[tag=!Ply.Weapon.UsingArts.2] if score @s Ply.Stats.Arts.2.Percent matches 700.. run return run function mhdp_items:player/ui/arts/full_1

# UI設定
    function mhdp_items:player/ui/arts/gauge_2
    scoreboard players operation #mhdp_temp_arts MhdpCore = @s Ply.Stats.Arts.2.Percent
    execute if score #mhdp_temp_arts MhdpCore matches ..0 run data modify storage mhdp_core:temp UI.ArtsArray2 append value [{"text":"0","font":"ui/new_player_ui/arts/gauge","shadow_color":[0,0,0,0]},{"text": "\uF801","font": "space"}]
    execute if score #mhdp_temp_arts MhdpCore matches 1.. run data modify storage mhdp_core:temp UI.ArtsArray2 append value [{"text":"1","font":"ui/new_player_ui/arts/gauge","shadow_color":[0,0,0,0]},{"text": "\uF801","font": "space"}]
    execute if entity @s[tag=!Ply.Weapon.UsingArts.2] run function mhdp_items:player/ui/arts/append_2
    execute if entity @s[tag=Ply.Weapon.UsingArts.2] run function mhdp_items:player/ui/arts/append_using_2
    scoreboard players operation #mhdp_temp_arts MhdpCore -= #const_100 Const
    execute if entity @s[tag=!Ply.Weapon.UsingArts.2] run function mhdp_items:player/ui/arts/append_2
    execute if entity @s[tag=Ply.Weapon.UsingArts.2] run function mhdp_items:player/ui/arts/append_using_2
    scoreboard players operation #mhdp_temp_arts MhdpCore -= #const_100 Const
    execute if entity @s[tag=!Ply.Weapon.UsingArts.2] run function mhdp_items:player/ui/arts/append_2
    execute if entity @s[tag=Ply.Weapon.UsingArts.2] run function mhdp_items:player/ui/arts/append_using_2
    scoreboard players operation #mhdp_temp_arts MhdpCore -= #const_100 Const
    execute if entity @s[tag=!Ply.Weapon.UsingArts.2] run function mhdp_items:player/ui/arts/append_2
    execute if entity @s[tag=Ply.Weapon.UsingArts.2] run function mhdp_items:player/ui/arts/append_using_2
    scoreboard players operation #mhdp_temp_arts MhdpCore -= #const_100 Const
    execute if entity @s[tag=!Ply.Weapon.UsingArts.2] run function mhdp_items:player/ui/arts/append_2
    execute if entity @s[tag=Ply.Weapon.UsingArts.2] run function mhdp_items:player/ui/arts/append_using_2
    scoreboard players operation #mhdp_temp_arts MhdpCore -= #const_100 Const
    execute if entity @s[tag=!Ply.Weapon.UsingArts.2] run function mhdp_items:player/ui/arts/append_2
    execute if entity @s[tag=Ply.Weapon.UsingArts.2] run function mhdp_items:player/ui/arts/append_using_2
    scoreboard players operation #mhdp_temp_arts MhdpCore -= #const_100 Const
    execute if entity @s[tag=!Ply.Weapon.UsingArts.2] run function mhdp_items:player/ui/arts/append_2
    execute if entity @s[tag=Ply.Weapon.UsingArts.2] run function mhdp_items:player/ui/arts/append_using_2
    execute if score #mhdp_temp_arts MhdpCore matches ..99 run data modify storage mhdp_core:temp UI.ArtsArray2 append value [{"text":"0","font":"ui/new_player_ui/arts/gauge","shadow_color":[0,0,0,0]},{"text": "\uF801","font": "space"}]
    execute if score #mhdp_temp_arts MhdpCore matches 100.. run data modify storage mhdp_core:temp UI.ArtsArray2 append value [{"text":"1","font":"ui/new_player_ui/arts/gauge","shadow_color":[0,0,0,0]},{"text": "\uF801","font": "space"}]
    scoreboard players operation #mhdp_temp_arts MhdpCore -= #const_100 Const

# 表示
    # +2px edge1px gaude35px edge1px -39px waku41px
    data modify storage mhdp_core:temp UI.Arts2 set value [\
        {"text":"\uF802\uF802","font": "space"},\
        {"interpret":true,"nbt":"UI.ArtsArray2[0]","storage":"mhdp_core:temp"},{"interpret":true,"nbt":"UI.ArtsArray2[1]","storage":"mhdp_core:temp"},{"interpret":true,"nbt":"UI.ArtsArray2[2]","storage":"mhdp_core:temp"},{"interpret":true,"nbt":"UI.ArtsArray2[3]","storage":"mhdp_core:temp"},{"interpret":true,"nbt":"UI.ArtsArray2[4]","storage":"mhdp_core:temp"},{"interpret":true,"nbt":"UI.ArtsArray2[5]","storage":"mhdp_core:temp"},{"interpret":true,"nbt":"UI.ArtsArray2[6]","storage":"mhdp_core:temp"},{"interpret":true,"nbt":"UI.ArtsArray2[7]","storage":"mhdp_core:temp"},{"interpret":true,"nbt":"UI.ArtsArray2[8]","storage":"mhdp_core:temp"},\
        {"text":"\uF999\uF999\uF999\uF999\uF802","font": "space"},\
        {"interpret":true,"nbt":"UI.ArtsGauge2","storage":"mhdp_core:temp"}\
    ]

# 終了
    scoreboard players reset #mhdp_temp_arts
