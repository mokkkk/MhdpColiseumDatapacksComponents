#> mhdp_items:weapons/bow/util/ui
#
# 武器のUI描画処理
#
# @within function mhdp_items:core/switch/macro/m.ui

# 地の型では使用しない
    execute if entity @s[tag=!Ply.Weapon.Type.Tech] run return 0

# UI設定
    scoreboard players operation #mhdp_temp_gauge MhdpCore = @s Wpn.Bw.Gauge
    function mhdp_items:weapons/bow/util/ui/append
    scoreboard players remove #mhdp_temp_gauge MhdpCore 100
    function mhdp_items:weapons/bow/util/ui/append
    scoreboard players remove #mhdp_temp_gauge MhdpCore 100
    function mhdp_items:weapons/bow/util/ui/append

# 表示
    data modify storage mhdp_core:temp UI.Weapon set value [\
        {"interpret":true,"nbt":"UI.ExArray[0]","storage":"mhdp_core:temp"},\
        {"interpret":true,"nbt":"UI.ExArray[1]","storage":"mhdp_core:temp"},\
        {"interpret":true,"nbt":"UI.ExArray[2]","storage":"mhdp_core:temp"},\
        {"text":"\uF814","font":"space"},{"text":"\uF801","font":"space"},{"text":"#","font":"ui/weapon/bow/gauge"},{"text":"\uF802","font":"space"}\
    ]

# 終了
    scoreboard players reset #mhdp_temp_gauge
