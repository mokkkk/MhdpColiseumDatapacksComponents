#> mhdp_items:weapons/bow/util/ui_bottle/main
#
# 武器のUI描画処理
#
# @within function mhdp_items:weapons/bow/util/ui

# UI設定
    data modify storage mhdp_core:temp UI.BowBottleArray set value []
    scoreboard players operation #mhdp_temp_bottle MhdpCore = @s Wpn.Bw.Bottle.Count
    scoreboard players operation #mhdp_temp_bottle_targetting MhdpCore = @s Wpn.Bw.Bottle.Targetting
    function mhdp_items:weapons/bow/util/ui_bottle/append
    function mhdp_items:weapons/bow/util/ui_bottle/append
    function mhdp_items:weapons/bow/util/ui_bottle/append
    function mhdp_items:weapons/bow/util/ui_bottle/append
    function mhdp_items:weapons/bow/util/ui_bottle/append
    function mhdp_items:weapons/bow/util/ui_bottle/append
    function mhdp_items:weapons/bow/util/ui_bottle/append
    function mhdp_items:weapons/bow/util/ui_bottle/append

# 表示
    data modify storage mhdp_core:temp UI.Bottle set value [\
        {"interpret":true,"nbt":"UI.BowBottleArray[0]","storage":"mhdp_core:temp","shadow_color":[0,0,0,0]},{"text":"\uF805","font": "ui/weapon/space"},\
        {"interpret":true,"nbt":"UI.BowBottleArray[1]","storage":"mhdp_core:temp","shadow_color":[0,0,0,0]},{"text":"\uF805","font": "ui/weapon/space"},\
        {"interpret":true,"nbt":"UI.BowBottleArray[2]","storage":"mhdp_core:temp","shadow_color":[0,0,0,0]},{"text":"\uF805","font": "ui/weapon/space"},\
        {"interpret":true,"nbt":"UI.BowBottleArray[3]","storage":"mhdp_core:temp","shadow_color":[0,0,0,0]},{"text":"\uF805","font": "ui/weapon/space"},\
        {"interpret":true,"nbt":"UI.BowBottleArray[4]","storage":"mhdp_core:temp","shadow_color":[0,0,0,0]},{"text":"\uF805","font": "ui/weapon/space"},\
        {"interpret":true,"nbt":"UI.BowBottleArray[5]","storage":"mhdp_core:temp","shadow_color":[0,0,0,0]},{"text":"\uF805","font": "ui/weapon/space"},\
        {"interpret":true,"nbt":"UI.BowBottleArray[6]","storage":"mhdp_core:temp","shadow_color":[0,0,0,0]},{"text":"\uF805","font": "ui/weapon/space"},\
        {"interpret":true,"nbt":"UI.BowBottleArray[7]","storage":"mhdp_core:temp","shadow_color":[0,0,0,0]},{"text":"\uF805","font": "ui/weapon/space"}\
        ]

# 終了
    scoreboard players reset #mhdp_temp_bottle
