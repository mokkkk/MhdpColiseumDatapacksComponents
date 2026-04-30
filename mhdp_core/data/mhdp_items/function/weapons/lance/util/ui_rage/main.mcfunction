#> mhdp_items:weapons/lance/util/ui_rage/main
#
# 武器のUI描画処理
#
# @within function mhdp_items:core/switch/macro/m.ui

# 値取得
    scoreboard players operation #mhdp_temp_gauge MhdpCore = @s Wpn.Lc.RageTimer
    execute unless score @s Wpn.Lc.RageLevel matches 2.. run function mhdp_items:weapons/lance/util/ui_rage/append_start_0
    execute if score @s Wpn.Lc.RageLevel matches 2 run function mhdp_items:weapons/lance/util/ui_rage/append_start_1
    execute if score @s Wpn.Lc.RageLevel matches 3 run function mhdp_items:weapons/lance/util/ui_rage/append_start_2
    scoreboard players remove #mhdp_temp_gauge MhdpCore 200
    execute unless score @s Wpn.Lc.RageLevel matches 2.. run function mhdp_items:weapons/lance/util/ui_rage/append_0
    execute if score @s Wpn.Lc.RageLevel matches 2 run function mhdp_items:weapons/lance/util/ui_rage/append_1
    execute if score @s Wpn.Lc.RageLevel matches 3 run function mhdp_items:weapons/lance/util/ui_rage/append_2
    scoreboard players remove #mhdp_temp_gauge MhdpCore 200
    execute unless score @s Wpn.Lc.RageLevel matches 2.. run function mhdp_items:weapons/lance/util/ui_rage/append_0
    execute if score @s Wpn.Lc.RageLevel matches 2 run function mhdp_items:weapons/lance/util/ui_rage/append_1
    execute if score @s Wpn.Lc.RageLevel matches 3 run function mhdp_items:weapons/lance/util/ui_rage/append_2

# UI作成
# 20px + 20px + 20px - 70px
    data modify storage mhdp_core:temp UI.Rage set value [\
        {"interpret":true,"nbt":"UI.RageArray[0]","storage":"mhdp_core:temp"},\
        {"interpret":true,"nbt":"UI.RageArray[1]","storage":"mhdp_core:temp"},\
        {"interpret":true,"nbt":"UI.RageArray[2]","storage":"mhdp_core:temp"},\
        {"text":"\uF806","font":"ui/weapon/space"},\
        {"text":"#","font":"ui/weapon/lance/gauge"}\
    ]

# 終了
    scoreboard players reset #mhdp_temp_gauge
