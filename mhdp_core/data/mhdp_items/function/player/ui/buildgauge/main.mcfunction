#> mhdp_items:player/ui/buildgauge/main
#
# UI表示処理等 建材ゲージ関連
#

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
