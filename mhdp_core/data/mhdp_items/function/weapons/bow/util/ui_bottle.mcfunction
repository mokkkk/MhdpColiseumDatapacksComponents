#> mhdp_items:weapons/bow/util/ui_bottle
#
# 武器のUI描画処理
#
# @within function mhdp_items:core/switch/macro/m.ui

# 地の型では使用しない
    execute if entity @s[tag=!Ply.Weapon.Type.Tech] run return 0

# UI設定
    data modify storage mhdp_core:temp UI.BowBottleArray set value []
    scoreboard players operation #mhdp_temp_bottle MhdpCore = @s Wpn.Bw.Bottle.Count
    function mhdp_items:weapons/bow/util/ui_bottle/append
    scoreboard players remove #mhdp_temp_bottle MhdpCore 1
    function mhdp_items:weapons/bow/util/ui_bottle/append
    scoreboard players remove #mhdp_temp_bottle MhdpCore 1
    function mhdp_items:weapons/bow/util/ui_bottle/append
    scoreboard players remove #mhdp_temp_bottle MhdpCore 1
    function mhdp_items:weapons/bow/util/ui_bottle/append
    scoreboard players remove #mhdp_temp_bottle MhdpCore 1
    function mhdp_items:weapons/bow/util/ui_bottle/append
    scoreboard players remove #mhdp_temp_bottle MhdpCore 1
    function mhdp_items:weapons/bow/util/ui_bottle/append
    scoreboard players remove #mhdp_temp_bottle MhdpCore 1
    function mhdp_items:weapons/bow/util/ui_bottle/append
    scoreboard players remove #mhdp_temp_bottle MhdpCore 1
    function mhdp_items:weapons/bow/util/ui_bottle/append

# 表示
    data modify storage mhdp_core:temp UI.Sharpness set value '[\
        {"interpret":true,"nbt":"UI.BowBottleArray[0]","storage":"mhdp_core:temp"},\
        {"interpret":true,"nbt":"UI.BowBottleArray[1]","storage":"mhdp_core:temp"},\
        {"interpret":true,"nbt":"UI.BowBottleArray[2]","storage":"mhdp_core:temp"},\
        {"interpret":true,"nbt":"UI.BowBottleArray[3]","storage":"mhdp_core:temp"},\
        {"interpret":true,"nbt":"UI.BowBottleArray[4]","storage":"mhdp_core:temp"},\
        {"interpret":true,"nbt":"UI.BowBottleArray[5]","storage":"mhdp_core:temp"},\
        {"interpret":true,"nbt":"UI.BowBottleArray[6]","storage":"mhdp_core:temp"},\
        {"interpret":true,"nbt":"UI.BowBottleArray[7]","storage":"mhdp_core:temp"},\
        {"text":"\\uF804","font": "space"}\
        ]'

# 終了
    scoreboard players reset #mhdp_temp_bottle
