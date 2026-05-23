#> mhdp_items:weapons/long_sword/util/ui
#
# 武器のUI描画処理
#
# @within function mhdp_items:core/switch/macro/m.ui

# 斬れ味(44px)
    function mhdp_items:player/ui/sharpness/main

# space(+8px)

# 練気ゲージ(45px)
    function mhdp_items:weapons/long_sword/util/ui_spirit/main

# 残り空欄(51px)
    data modify storage mhdp_core:temp UI.Dummy set value {"text":"\uF904","font":"ui/weapon/space"}

# UI作成(148px)
    data modify storage mhdp_core:temp UI.Weapon set value [\
        {"interpret":true,"nbt":"UI.Sharpness","storage":"mhdp_core:temp"},\
        {"text":"\uF902","font": "ui/weapon/space"},\
        {"interpret":true,"nbt":"UI.Spirit","storage":"mhdp_core:temp"},\
        {"interpret":true,"nbt":"UI.Dummy","storage":"mhdp_core:temp"}\
    ]
