#> mhdp_items:player/ui/stamina/main
#
# UI表示処理等 スタミナ関連
#

# UI設定
    scoreboard players set #mhdp_const_125 MhdpCore 125
    scoreboard players operation #mhdp_temp_stamina MhdpCore = @s Ply.Stats.Stamina
    function mhdp_items:player/ui/stamina/append
    scoreboard players operation #mhdp_temp_stamina MhdpCore -= #mhdp_const_125 MhdpCore
    function mhdp_items:player/ui/stamina/append
    scoreboard players operation #mhdp_temp_stamina MhdpCore -= #mhdp_const_125 MhdpCore
    function mhdp_items:player/ui/stamina/append
    scoreboard players operation #mhdp_temp_stamina MhdpCore -= #mhdp_const_125 MhdpCore
    function mhdp_items:player/ui/stamina/append
    scoreboard players operation #mhdp_temp_stamina MhdpCore -= #mhdp_const_125 MhdpCore
    function mhdp_items:player/ui/stamina/append
    scoreboard players operation #mhdp_temp_stamina MhdpCore -= #mhdp_const_125 MhdpCore
    function mhdp_items:player/ui/stamina/append
    scoreboard players operation #mhdp_temp_stamina MhdpCore -= #mhdp_const_125 MhdpCore
    function mhdp_items:player/ui/stamina/append
    scoreboard players operation #mhdp_temp_stamina MhdpCore -= #mhdp_const_125 MhdpCore
    function mhdp_items:player/ui/stamina/append
    scoreboard players operation #mhdp_temp_stamina MhdpCore -= #mhdp_const_125 MhdpCore

# 表示
    data modify storage mhdp_core:temp UI.Stamina set value [{"interpret":true,"nbt":"UI.StaminaArray[0]","storage":"mhdp_core:temp"},{"interpret":true,"nbt":"UI.StaminaArray[1]","storage":"mhdp_core:temp"},{"interpret":true,"nbt":"UI.StaminaArray[2]","storage":"mhdp_core:temp"},{"interpret":true,"nbt":"UI.StaminaArray[3]","storage":"mhdp_core:temp"},{"interpret":true,"nbt":"UI.StaminaArray[4]","storage":"mhdp_core:temp"},{"interpret":true,"nbt":"UI.StaminaArray[5]","storage":"mhdp_core:temp"},{"interpret":true,"nbt":"UI.StaminaArray[6]","storage":"mhdp_core:temp"},{"interpret":true,"nbt":"UI.StaminaArray[7]","storage":"mhdp_core:temp"},{"interpret":true,"nbt":"UI.StaminaArray[8]","storage":"mhdp_core:temp"},{"interpret":true,"nbt":"UI.StaminaArray[9]","storage":"mhdp_core:temp"},{"text":"\uF813\uF801","font": "space"},{"text":"_","font":"ui/new_player_ui/stamina","color":"white","shadow_color":[0,0,0,0]}]

# 終了
    scoreboard players reset #mhdp_temp_stamina
