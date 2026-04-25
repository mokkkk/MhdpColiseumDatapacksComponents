#> mhdp_items:weapons/lance/util/ui
#
# 武器のUI描画処理
#
# @within function mhdp_items:core/switch/macro/m.ui

# 斬れ味(44px)
    function mhdp_items:player/ui/sharpness/main

# space(+8px)

# レイジゲージ(62px)
    function mhdp_items:weapons/lance/util/ui_rage/main

# 残り空欄(35px)
    data modify storage mhdp_core:temp UI.Dummy set value {"text":"\uF903","font":"ui/weapon/space"}

# UI作成(149px)
    data modify storage mhdp_core:temp UI.Weapon set value [\
        {"interpret":true,"nbt":"UI.Sharpness","storage":"mhdp_core:temp"},\
        {"text":"\uF902","font": "ui/weapon/space"},\
        {"interpret":true,"nbt":"UI.Rage","storage":"mhdp_core:temp"},\
        {"interpret":true,"nbt":"UI.Dummy","storage":"mhdp_core:temp"}\
    ]
