#> mhdp_items:player/ui/arts/main_1
#
# UI表示処理等 スタミナ関連
#

# 割合取得
    scoreboard players operation @s Ply.Stats.Arts.1.Percent = @s Ply.Stats.Arts.1
    scoreboard players operation @s Ply.Stats.Arts.1.Percent *= #const_100 Const
    scoreboard players operation @s Ply.Stats.Arts.1.Percent /= @s Ply.Stats.Arts.1.Max
    scoreboard players operation @s Ply.Stats.Arts.1.Percent *= #const_7 Const

# ゲージ満タンの場合の処理
    # execute if entity @s[tag=!Ply.Weapon.UsingArts.2] if score @s Ply.Stats.Arts.1.Percent matches 700.. run return run function mhdp_items:player/ui/arts/full_1

# UI設定
    function mhdp_items:player/ui/arts/gauge_1
    scoreboard players operation #mhdp_temp_arts MhdpCore = @s Ply.Stats.Arts.1.Percent
    execute if score #mhdp_temp_arts MhdpCore matches ..0 run data modify storage mhdp_core:temp UI.ArtsArray1 append value [{"text":"0","font":"ui/new_player_ui/arts/gauge","shadow_color":[0,0,0,0]},{"text": "\uF801","font": "space"}]
    execute if entity @s[tag=!Ply.Weapon.UsingArts.1] if score #mhdp_temp_arts MhdpCore matches 1.. run data modify storage mhdp_core:temp UI.ArtsArray1 append value [{"text":"1","font":"ui/new_player_ui/arts/gauge","shadow_color":[0,0,0,0]},{"text": "\uF801","font": "space"}]
    execute if entity @s[tag=Ply.Weapon.UsingArts.1] if score #mhdp_temp_arts MhdpCore matches 1.. run data modify storage mhdp_core:temp UI.ArtsArray1 append value [{"text":"2","font":"ui/new_player_ui/arts/gauge","shadow_color":[0,0,0,0]},{"text": "\uF801","font": "space"}]
    execute if entity @s[tag=!Ply.Weapon.UsingArts.1] run function mhdp_items:player/ui/arts/append_1
    execute if entity @s[tag=Ply.Weapon.UsingArts.1] run function mhdp_items:player/ui/arts/append_using_1
    scoreboard players operation #mhdp_temp_arts MhdpCore -= #const_100 Const
    execute if entity @s[tag=!Ply.Weapon.UsingArts.1] run function mhdp_items:player/ui/arts/append_1
    execute if entity @s[tag=Ply.Weapon.UsingArts.1] run function mhdp_items:player/ui/arts/append_using_1
    scoreboard players operation #mhdp_temp_arts MhdpCore -= #const_100 Const
    execute if entity @s[tag=!Ply.Weapon.UsingArts.1] run function mhdp_items:player/ui/arts/append_1
    execute if entity @s[tag=Ply.Weapon.UsingArts.1] run function mhdp_items:player/ui/arts/append_using_1
    scoreboard players operation #mhdp_temp_arts MhdpCore -= #const_100 Const
    execute if entity @s[tag=!Ply.Weapon.UsingArts.1] run function mhdp_items:player/ui/arts/append_1
    execute if entity @s[tag=Ply.Weapon.UsingArts.1] run function mhdp_items:player/ui/arts/append_using_1
    scoreboard players operation #mhdp_temp_arts MhdpCore -= #const_100 Const
    execute if entity @s[tag=!Ply.Weapon.UsingArts.1] run function mhdp_items:player/ui/arts/append_1
    execute if entity @s[tag=Ply.Weapon.UsingArts.1] run function mhdp_items:player/ui/arts/append_using_1
    scoreboard players operation #mhdp_temp_arts MhdpCore -= #const_100 Const
    execute if entity @s[tag=!Ply.Weapon.UsingArts.1] run function mhdp_items:player/ui/arts/append_1
    execute if entity @s[tag=Ply.Weapon.UsingArts.1] run function mhdp_items:player/ui/arts/append_using_1
    scoreboard players operation #mhdp_temp_arts MhdpCore -= #const_100 Const
    execute if entity @s[tag=!Ply.Weapon.UsingArts.1] run function mhdp_items:player/ui/arts/append_1
    execute if entity @s[tag=Ply.Weapon.UsingArts.1] run function mhdp_items:player/ui/arts/append_using_1
    execute if score #mhdp_temp_arts MhdpCore matches ..99 run data modify storage mhdp_core:temp UI.ArtsArray1 append value [{"text":"0","font":"ui/new_player_ui/arts/gauge","shadow_color":[0,0,0,0]},{"text": "\uF801","font": "space"}]
    execute if entity @s[tag=!Ply.Weapon.UsingArts.1] if score #mhdp_temp_arts MhdpCore matches 100.. run data modify storage mhdp_core:temp UI.ArtsArray1 append value [{"text":"1","font":"ui/new_player_ui/arts/gauge","shadow_color":[0,0,0,0]},{"text": "\uF801","font": "space"}]
    execute if entity @s[tag=Ply.Weapon.UsingArts.1] if score #mhdp_temp_arts MhdpCore matches 100.. run data modify storage mhdp_core:temp UI.ArtsArray1 append value [{"text":"2","font":"ui/new_player_ui/arts/gauge","shadow_color":[0,0,0,0]},{"text": "\uF801","font": "space"}]
    scoreboard players operation #mhdp_temp_arts MhdpCore -= #const_100 Const

# 表示
    # +1px edge1px gaude35px edge1px -39px waku41px
    data modify storage mhdp_core:temp UI.Arts1 set value [\
        {"text":"\uF802","font": "space"},\
        {"interpret":true,"nbt":"UI.ArtsArray1[0]","storage":"mhdp_core:temp"},{"interpret":true,"nbt":"UI.ArtsArray1[1]","storage":"mhdp_core:temp"},{"interpret":true,"nbt":"UI.ArtsArray1[2]","storage":"mhdp_core:temp"},{"interpret":true,"nbt":"UI.ArtsArray1[3]","storage":"mhdp_core:temp"},{"interpret":true,"nbt":"UI.ArtsArray1[4]","storage":"mhdp_core:temp"},{"interpret":true,"nbt":"UI.ArtsArray1[5]","storage":"mhdp_core:temp"},{"interpret":true,"nbt":"UI.ArtsArray1[6]","storage":"mhdp_core:temp"},{"interpret":true,"nbt":"UI.ArtsArray1[7]","storage":"mhdp_core:temp"},{"interpret":true,"nbt":"UI.ArtsArray1[8]","storage":"mhdp_core:temp"},\
        {"text":"\uF999\uF999\uF999\uF999\uF802","font": "space"},\
        {"interpret":true,"nbt":"UI.ArtsGauge1","storage":"mhdp_core:temp"}\
    ]

# 終了
    scoreboard players reset #mhdp_temp_arts
