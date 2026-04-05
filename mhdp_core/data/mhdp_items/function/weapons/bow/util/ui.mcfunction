#> mhdp_items:weapons/bow/util/ui
#
# 武器のUI描画処理
#
# @within function mhdp_items:core/switch/macro/m.ui

# ビンゲージ(48px)
    function mhdp_items:weapons/bow/util/ui_bottle/main

# 空欄(4px)

# 仕掛け矢ゲージ(60px)
    function mhdp_items:weapons/bow/util/ui_trick_arrow/main

# 残り空欄(29px)
    data modify storage mhdp_core:temp UI.Dummy set value {"text":"\uF901","font":"ui/weapon/space"}
    
# UI作成(149px)
    data modify storage mhdp_core:temp UI.Weapon set value [\
        {"interpret":true,"nbt":"UI.Bottle","storage":"mhdp_core:temp"},\
        {"text":"\uF804","font": "space"},\
        {"interpret":true,"nbt":"UI.TrickArrow","storage":"mhdp_core:temp"},\
        {"interpret":true,"nbt":"UI.Dummy","storage":"mhdp_core:temp"}\
    ]

# # 地の型では使用しない
#     execute if entity @s[tag=!Ply.Weapon.Type.Tech] run return 0

# # UI設定
#     scoreboard players operation #mhdp_temp_gauge MhdpCore = @s Wpn.Bw.Gauge
#     function mhdp_items:weapons/bow/util/ui/append
#     scoreboard players remove #mhdp_temp_gauge MhdpCore 100
#     function mhdp_items:weapons/bow/util/ui/append
#     scoreboard players remove #mhdp_temp_gauge MhdpCore 100
#     function mhdp_items:weapons/bow/util/ui/append

# # 表示
#     data modify storage mhdp_core:temp UI.Weapon set value [\
#         {"interpret":true,"nbt":"UI.ExArray[0]","storage":"mhdp_core:temp"},\
#         {"interpret":true,"nbt":"UI.ExArray[1]","storage":"mhdp_core:temp"},\
#         {"interpret":true,"nbt":"UI.ExArray[2]","storage":"mhdp_core:temp"},\
#         {"text":"\uF814","font":"space"},{"text":"\uF801","font":"space"},{"text":"#","font":"ui/weapon/bow/gauge"},{"text":"\uF802","font":"space"}\
#     ]

