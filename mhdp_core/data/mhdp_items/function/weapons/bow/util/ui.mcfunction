#> mhdp_items:weapons/bow/util/ui
#
# 武器のUI描画処理
#
# @within function mhdp_items:core/switch/macro/m.ui

# space(+8px)

# ビンゲージ(32px)
    function mhdp_items:weapons/bow/util/ui_bottle/main

# space(-35px)

# 仕掛け矢ゲージ(71px)
    function mhdp_items:weapons/bow/util/ui_trick_arrow/main

# 残り空欄(76px)
    data modify storage mhdp_core:temp UI.Dummy set value {"text":"\uF901","font":"ui/weapon/space"}

# UI作成(149px)
    data modify storage mhdp_core:temp UI.Weapon set value [\
        {"text":"\uF902","font": "ui/weapon/space"},\
        {"interpret":true,"nbt":"UI.Bottle","storage":"mhdp_core:temp"},\
        {"text":"\uF804","font": "ui/weapon/space"},\
        {"interpret":true,"nbt":"UI.TrickArrow","storage":"mhdp_core:temp"},\
        {"interpret":true,"nbt":"UI.Dummy","storage":"mhdp_core:temp"}\
    ]
