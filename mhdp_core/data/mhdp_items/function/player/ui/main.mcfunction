#> mhdp_items:player/ui/main
#
# UI処理
#
# @within function mhdp_core:player/tick

# 初期化
    data modify storage mhdp_core:temp UI set value {Sharpness:{},Stamina:{},StaminaArray:[],ExArray:[]}

# 斬れ味
    function mhdp_items:player/ui/sharpness/main

# 武器ごとの特殊ゲージ
    function mhdp_items:player/ui/weapon/main

# 特殊装具
    function mhdp_items:player/ui/item/main

# 狩技
    function mhdp_items:player/ui/arts/main_1
    function mhdp_items:player/ui/arts/main_2

# スキル関連

# スタミナ
    function mhdp_items:player/ui/stamina/main

# UI表示
# 1段：斬れ味(60px) +4px 武器(60px) +10px アイテム1(16px) +10px アイテム2(16px)  - 計176px
# 3段：-176px -70px 狩技2(62px) +68px +116px - 計0px
# 3段：-176px -70px 狩技1(62px) +68px +116px - 計0px
# 4段：                                              +4px -80px スタミナ(80px) - 計 4px
    title @s actionbar [\
        {"interpret":true,"nbt":"UI.Sharpness","storage":"mhdp_core:temp"},\
        {"text":"\uF804","font":"space"},\
        {"interpret":true,"nbt":"UI.Weapon","storage":"mhdp_core:temp"},\
        {"text":"\uF888","font":"space"},\
        {"interpret":true,"nbt":"UI.Item0","storage":"mhdp_core:temp"},\
        {"text":"\uF888","font":"space"},\
        {"interpret":true,"nbt":"UI.Item1","storage":"mhdp_core:temp"},\
        \
        {"text":"\uF812\uF812 ","font":"space"},\
        {"text":"\uF998\uF998\uF814\uF998\uF998\uF998","font":"space"},\
        {"interpret":true,"nbt":"UI.Arts1","storage":"mhdp_core:temp"},\
        {"text":"\uF821\uF888\uF888  ","font":"space"},\
        {"text":"\uF900\uF998\uF998","font":"space"},\
        \
        {"text":"\uF812\uF812 ","font":"space"},\
        {"text":"\uF998\uF998\uF814\uF998\uF998\uF998","font":"space"},\
        {"interpret":true,"nbt":"UI.Arts2","storage":"mhdp_core:temp"},\
        {"text":"\uF821\uF888\uF888  ","font":"space"},\
        {"text":"\uF801","font":"space"},\
        {"text":"\uF900\uF998\uF998","font":"space"},\
        \
        {"text": " \uF812\uF888\uF801","font":"space"},\
        {"interpret":true,"nbt":"UI.Stamina","storage":"mhdp_core:temp"}\
    ]

# 終了
    data remove storage mhdp_core:temp UI
