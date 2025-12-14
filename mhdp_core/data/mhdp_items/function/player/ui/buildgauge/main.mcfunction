#> mhdp_items:player/ui/buildgauge/main
#
# UI表示処理等 建材ゲージ関連
#

# メモリ計算
    execute if score @s Ply.Stats.BuildGauge.Count matches ..0 if score @s Ply.Stats.BuildGauge matches 125.. run function mhdp_items:player/ui/buildgauge/up_count
    execute if score @s Ply.Stats.BuildGauge.Count matches ..1 if score @s Ply.Stats.BuildGauge matches 250.. run function mhdp_items:player/ui/buildgauge/up_count
    execute if score @s Ply.Stats.BuildGauge.Count matches ..2 if score @s Ply.Stats.BuildGauge matches 375.. run function mhdp_items:player/ui/buildgauge/up_count
    execute if score @s Ply.Stats.BuildGauge.Count matches ..3 if score @s Ply.Stats.BuildGauge matches 500.. run function mhdp_items:player/ui/buildgauge/up_count
    execute if score @s Ply.Stats.BuildGauge.Count matches ..4 if score @s Ply.Stats.BuildGauge matches 625.. run function mhdp_items:player/ui/buildgauge/up_count
    execute if score @s Ply.Stats.BuildGauge.Count matches ..5 if score @s Ply.Stats.BuildGauge matches 750.. run function mhdp_items:player/ui/buildgauge/up_count
    execute if score @s Ply.Stats.BuildGauge.Count matches ..6 if score @s Ply.Stats.BuildGauge matches 875.. run function mhdp_items:player/ui/buildgauge/up_count
    execute if score @s Ply.Stats.BuildGauge.Count matches ..7 if score @s Ply.Stats.BuildGauge matches 1000.. run function mhdp_items:player/ui/buildgauge/up_count

# UI設定
    scoreboard players set #mhdp_const_125 MhdpCore 125
    scoreboard players operation #mhdp_temp_buildgauge MhdpCore = @s Ply.Stats.BuildGauge
    function mhdp_items:player/ui/buildgauge/append
    scoreboard players operation #mhdp_temp_buildgauge MhdpCore -= #mhdp_const_125 MhdpCore
    function mhdp_items:player/ui/buildgauge/append
    scoreboard players operation #mhdp_temp_buildgauge MhdpCore -= #mhdp_const_125 MhdpCore
    function mhdp_items:player/ui/buildgauge/append
    scoreboard players operation #mhdp_temp_buildgauge MhdpCore -= #mhdp_const_125 MhdpCore
    function mhdp_items:player/ui/buildgauge/append
    scoreboard players operation #mhdp_temp_buildgauge MhdpCore -= #mhdp_const_125 MhdpCore
    function mhdp_items:player/ui/buildgauge/append
    scoreboard players operation #mhdp_temp_buildgauge MhdpCore -= #mhdp_const_125 MhdpCore
    function mhdp_items:player/ui/buildgauge/append
    scoreboard players operation #mhdp_temp_buildgauge MhdpCore -= #mhdp_const_125 MhdpCore
    function mhdp_items:player/ui/buildgauge/append
    scoreboard players operation #mhdp_temp_buildgauge MhdpCore -= #mhdp_const_125 MhdpCore
    function mhdp_items:player/ui/buildgauge/append
    scoreboard players operation #mhdp_temp_buildgauge MhdpCore -= #mhdp_const_125 MhdpCore

# 表示
    data modify storage mhdp_core:temp UI.BuildGauge set value [{"interpret":true,"nbt":"UI.BuildGaugeArray[0]","storage":"mhdp_core:temp"},{"interpret":true,"nbt":"UI.BuildGaugeArray[1]","storage":"mhdp_core:temp"},{"interpret":true,"nbt":"UI.BuildGaugeArray[2]","storage":"mhdp_core:temp"},{"interpret":true,"nbt":"UI.BuildGaugeArray[3]","storage":"mhdp_core:temp"},{"interpret":true,"nbt":"UI.BuildGaugeArray[4]","storage":"mhdp_core:temp"},{"interpret":true,"nbt":"UI.BuildGaugeArray[5]","storage":"mhdp_core:temp"},{"interpret":true,"nbt":"UI.BuildGaugeArray[6]","storage":"mhdp_core:temp"},{"interpret":true,"nbt":"UI.BuildGaugeArray[7]","storage":"mhdp_core:temp"},{"text":"\uF813\uF801","font": "space"},{"text":"_","font":"ui/new_player_ui/buildgauge","color":"white","shadow_color":[0,0,0,0]}]

# 終了
    scoreboard players reset #mhdp_temp_buildgauge
