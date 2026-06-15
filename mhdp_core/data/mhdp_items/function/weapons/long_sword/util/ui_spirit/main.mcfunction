#> mhdp_items:weapons/long_sword/util/ui_spirit/main
#
# 武器のUI描画処理
#
# @within function mhdp_items:core/switch/macro/m.ui

# 練気色
    scoreboard players operation #mhdp_temp_gauge MhdpCore = @s Wpn.Ls.SpiritLevelGauge
    execute if score @s Wpn.Ls.SpiritLevel matches ..1 run function mhdp_items:weapons/long_sword/util/ui_spirit/append_color.m {Color:"white",Type:0}
    execute if score @s Wpn.Ls.SpiritLevel matches 2 run function mhdp_items:weapons/long_sword/util/ui_spirit/append_color.m {Color:"yellow",Type:0}
    execute if score @s Wpn.Ls.SpiritLevel matches 3 run function mhdp_items:weapons/long_sword/util/ui_spirit/append_color.m {Color:"red",Type:0}
    scoreboard players remove #mhdp_temp_gauge MhdpCore 200
    execute if score @s Wpn.Ls.SpiritLevel matches ..1 run function mhdp_items:weapons/long_sword/util/ui_spirit/append_color.m {Color:"white",Type:1}
    execute if score @s Wpn.Ls.SpiritLevel matches 2 run function mhdp_items:weapons/long_sword/util/ui_spirit/append_color.m {Color:"yellow",Type:1}
    execute if score @s Wpn.Ls.SpiritLevel matches 3 run function mhdp_items:weapons/long_sword/util/ui_spirit/append_color.m {Color:"red",Type:1}
    scoreboard players remove #mhdp_temp_gauge MhdpCore 200
    execute if score @s Wpn.Ls.SpiritLevel matches ..1 run function mhdp_items:weapons/long_sword/util/ui_spirit/append_color.m {Color:"white",Type:2}
    execute if score @s Wpn.Ls.SpiritLevel matches 2 run function mhdp_items:weapons/long_sword/util/ui_spirit/append_color.m {Color:"yellow",Type:2}
    execute if score @s Wpn.Ls.SpiritLevel matches 3 run function mhdp_items:weapons/long_sword/util/ui_spirit/append_color.m {Color:"red",Type:2}
    scoreboard players reset #mhdp_temp_gauge

# 練気ゲージ
    scoreboard players operation #mhdp_temp_max_timer MhdpCore = @s Wpn.Ls.SpiritMaxTimer
    scoreboard players operation #mhdp_temp_max_timer MhdpCore %= #const_30 Const
    scoreboard players operation #mhdp_temp_gauge MhdpCore = @s Wpn.Ls.SpiritGauge
    execute if score #mhdp_temp_max_timer MhdpCore matches ..14 unless score @s Wpn.Ls.SpiritGaugeRegen matches 1.. run function mhdp_items:weapons/long_sword/util/ui_spirit/append_spirit.m {Color:"spirit",Type:0}
    execute if score #mhdp_temp_max_timer MhdpCore matches 15.. unless score @s Wpn.Ls.SpiritGaugeRegen matches 1.. run function mhdp_items:weapons/long_sword/util/ui_spirit/append_spirit_max.m {Color:"spirit",Type:0}
    execute if score @s Wpn.Ls.SpiritGaugeRegen matches 1.. run function mhdp_items:weapons/long_sword/util/ui_spirit/append_spirit.m {Color:"spirit_regen",Type:0}
    scoreboard players remove #mhdp_temp_gauge MhdpCore 334
    execute if score #mhdp_temp_max_timer MhdpCore matches ..14 unless score @s Wpn.Ls.SpiritGaugeRegen matches 1.. run function mhdp_items:weapons/long_sword/util/ui_spirit/append_spirit.m {Color:"spirit",Type:1}
    execute if score #mhdp_temp_max_timer MhdpCore matches 15.. unless score @s Wpn.Ls.SpiritGaugeRegen matches 1.. run function mhdp_items:weapons/long_sword/util/ui_spirit/append_spirit_max.m {Color:"spirit",Type:1}
    execute if score @s Wpn.Ls.SpiritGaugeRegen matches 1.. run function mhdp_items:weapons/long_sword/util/ui_spirit/append_spirit.m {Color:"spirit_regen",Type:1}
    scoreboard players remove #mhdp_temp_gauge MhdpCore 333
    execute if score #mhdp_temp_max_timer MhdpCore matches ..14 unless score @s Wpn.Ls.SpiritGaugeRegen matches 1.. run function mhdp_items:weapons/long_sword/util/ui_spirit/append_spirit.m {Color:"spirit",Type:2}
    execute if score #mhdp_temp_max_timer MhdpCore matches 15.. unless score @s Wpn.Ls.SpiritGaugeRegen matches 1.. run function mhdp_items:weapons/long_sword/util/ui_spirit/append_spirit_max.m {Color:"spirit",Type:2}
    execute if score @s Wpn.Ls.SpiritGaugeRegen matches 1.. run function mhdp_items:weapons/long_sword/util/ui_spirit/append_spirit.m {Color:"spirit_regen",Type:2}

# UI作成
# (+15px +15px +15px) -45px +9px (+11px +11px +11px) - 42px + 45px
    data modify storage mhdp_core:temp UI.Spirit set value [\
        {"interpret":true,"nbt":"UI.ColorArray[0]","storage":"mhdp_core:temp"},\
        {"interpret":true,"nbt":"UI.ColorArray[1]","storage":"mhdp_core:temp"},\
        {"interpret":true,"nbt":"UI.ColorArray[2]","storage":"mhdp_core:temp"},\
        {"text":"\uF808","font":"ui/weapon/space"},\
        {"text":"\uF902","font":"ui/weapon/space"},\
        {"interpret":true,"nbt":"UI.SpiritArray[0]","storage":"mhdp_core:temp"},\
        {"interpret":true,"nbt":"UI.SpiritArray[1]","storage":"mhdp_core:temp"},\
        {"interpret":true,"nbt":"UI.SpiritArray[2]","storage":"mhdp_core:temp"},\
        {"text":"\uF807","font":"ui/weapon/space"},\
        {"text":"#","font":"ui/weapon/long_sword/gauge"},\
        {"text":"\uF801","font":"ui/weapon/space"}\
    ]

# 終了
    scoreboard players reset #mhdp_temp_gauge
    scoreboard players reset #mhdp_temp_max_timer
