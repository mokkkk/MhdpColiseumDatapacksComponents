#> mhdp_items:weapons/bow/util/ui_trick_arrow/main
#
# 武器のUI描画処理
#
# @within function mhdp_items:core/switch/macro/m.ui

# 値取得
    scoreboard players operation #mhdp_temp_gauge MhdpCore = @s Wpn.Bw.Gauge
    function mhdp_items:weapons/bow/util/ui_trick_arrow/append
    scoreboard players remove #mhdp_temp_gauge MhdpCore 100
    function mhdp_items:weapons/bow/util/ui_trick_arrow/append
    scoreboard players remove #mhdp_temp_gauge MhdpCore 100
    function mhdp_items:weapons/bow/util/ui_trick_arrow/append

# UI作成
# 20px + 20px + 20px - 70px
    data modify storage mhdp_core:temp UI.TrickArrow set value [\
        {"interpret":true,"nbt":"UI.TrickArrowArray[0]","storage":"mhdp_core:temp"},\
        {"interpret":true,"nbt":"UI.TrickArrowArray[1]","storage":"mhdp_core:temp"},\
        {"interpret":true,"nbt":"UI.TrickArrowArray[2]","storage":"mhdp_core:temp"},\
        {"text":"\uF803","font":"ui/weapon/space"},\
        {"text":"#","font":"ui/weapon/bow/gauge"},\
        {"text":"\uF801","font":"space"}\
    ]

# 終了
    scoreboard players reset #mhdp_temp_gauge
