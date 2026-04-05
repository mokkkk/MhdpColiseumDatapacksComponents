#> mhdp_items:weapons/short_sword/util/ui
#
# 武器のUI描画処理
#
# @within function mhdp_items:core/switch/macro/m.ui

# 斬れ味(44px)
    function mhdp_items:player/ui/sharpness/main

# 残り空欄(105px)
    data modify storage mhdp_core:temp UI.Dummy set value {"text":"\uF900","font":"ui/weapon/space"}

# UI作成(149px)
    data modify storage mhdp_core:temp UI.Weapon set value [\
        {"interpret":true,"nbt":"UI.Sharpness","storage":"mhdp_core:temp"},\
        {"interpret":true,"nbt":"UI.Dummy","storage":"mhdp_core:temp"}\
    ]
