#> mhdp_items:player/ui/arts/main_2
#
# UI表示処理等 スタミナ関連
#

# UI設定
    # scoreboard players set #mhdp_const_125 MhdpCore 125
    # scoreboard players operation #mhdp_temp_arts MhdpCore = @s Ply.Stats.Arts
    scoreboard players set #mhdp_temp_arts MhdpCore 315
    function mhdp_items:player/ui/arts/append_2
    scoreboard players operation #mhdp_temp_arts MhdpCore -= #const_100 Const
    function mhdp_items:player/ui/arts/append_2
    scoreboard players operation #mhdp_temp_arts MhdpCore -= #const_100 Const
    function mhdp_items:player/ui/arts/append_2
    scoreboard players operation #mhdp_temp_arts MhdpCore -= #const_100 Const
    function mhdp_items:player/ui/arts/append_2
    scoreboard players operation #mhdp_temp_arts MhdpCore -= #const_100 Const
    function mhdp_items:player/ui/arts/append_2
    scoreboard players operation #mhdp_temp_arts MhdpCore -= #const_100 Const
    function mhdp_items:player/ui/arts/append_2
    scoreboard players operation #mhdp_temp_arts MhdpCore -= #const_100 Const

# 表示
    data modify storage mhdp_core:temp UI.Arts2 set value [{"interpret":true,"nbt":"UI.ArtsArray2[0]","storage":"mhdp_core:temp"},{"interpret":true,"nbt":"UI.ArtsArray2[1]","storage":"mhdp_core:temp"},{"interpret":true,"nbt":"UI.ArtsArray2[2]","storage":"mhdp_core:temp"},{"interpret":true,"nbt":"UI.ArtsArray2[3]","storage":"mhdp_core:temp"},{"interpret":true,"nbt":"UI.ArtsArray2[4]","storage":"mhdp_core:temp"},{"interpret":true,"nbt":"UI.ArtsArray2[5]","storage":"mhdp_core:temp"},{"text":"\uF814\uF801","font": "space"},{"text":"_","font":"ui/arts_2","color":"white"}]

# 終了
    scoreboard players reset #mhdp_temp_arts
