#> mhdp_items:player/ui/main
#
# UI処理
#
# @within function mhdp_core:player/tick

# 初期化
    data modify storage mhdp_core:temp UI set value {Weapon:{},Stamina:{},StaminaArray:[],ExArray:[]}
    # data modify storage mhdp_core:temp UI set value {Sharpness:{},Stamina:{},StaminaArray:[],ExArray:[]}

# 斬れ味
    # function mhdp_items:player/ui/sharpness/main

# 武器固有UI
    function mhdp_items:player/ui/weapon/main

# 特殊装具
    function mhdp_items:player/ui/item/main

# 狩技
    function mhdp_items:player/ui/arts/main_1
    function mhdp_items:player/ui/arts/main_2

# スキル関連

# 型
    function mhdp_items:player/ui/type

# スタミナ
    function mhdp_items:player/ui/stamina/main

# ブロック
    function mhdp_items:player/ui/block

# 建材ゲージ
    function mhdp_items:player/ui/buildgauge/main

# オプション
    function mhdp_items:player/ui/option/main

# UI表示
# 1： -7px 武器固有UI(149px) +4px アイテム1(16px) +4px アイテム2(16px) -1px : 計178px
# 2：-22px -200px 型表示(20) +180px +22px : 計0px
# 3：-204px タイマー(20px) -1px スタミナ(82px) +100px : 計-1px
# 4：-9px 狩技ゲージ1(41px) -2px 狩技ゲージ2(41px) : 計-1px
# 5：-89px 建築マーク(24px) -1px 建築ゲージ(82px) -1px : 計-1px
# 5：+7px ジャンプトグル(24px) -32px
    title @s actionbar [\
        {"text":"\uF998\uF998\uF998\uF801","font":"space"},\
        {"interpret":true,"nbt":"UI.Weapon","storage":"mhdp_core:temp"},\
        {"text":"\uF804","font":"space"},\
        {"interpret":true,"nbt":"UI.Item0","storage":"mhdp_core:temp"},\
        {"text":"\uF804","font":"space"},\
        {"interpret":true,"nbt":"UI.Item1","storage":"mhdp_core:temp"},\
        {"text":"\uF801","font":"space"},\
        \
        {"text":"\uF999\uF999\uF801\uF801\uF801","font":"space"},\
        {"text":"\uF815","font":"space"},\
        {"interpret":true,"nbt":"UI.Type","storage":"mhdp_core:temp"},\
        {"text":"\uF900\uF822","font":"space"},\
        {"text":"\uF888\uF888\uF802\uF802\uF802","font":"space"},\
        \
        {"text":"\uF815\uF998\uF998","font":"space"},\
        {"text":"#","font":"ui/new_player_ui/timer",shadow_color:[0,0,0,0]},\
        {"interpret":true,"nbt":"UI.Stamina","storage":"mhdp_core:temp"},\
        {"text":"\uF821\uF822","font":"space"},\
        \
        {"text":"\uF813\uF801","font":"space"},\
        {"interpret":true,"nbt":"UI.Arts1","storage":"mhdp_core:temp"},\
        {"text":"\uF998","font":"space"},\
        {"interpret":true,"nbt":"UI.Arts2","storage":"mhdp_core:temp"},\
        \
        {"text":"\uF813\uF998\uF998\uF998\uF801\uF801\uF801","font":"space"},\
        {"interpret":true,"nbt":"UI.Block","storage":"mhdp_core:temp"},\
        {"text":"\uF801","font":"space"},\
        {"interpret":true,"nbt":"UI.BuildGauge","storage":"mhdp_core:temp"},\
        {"text":"\uF801","font":"space"},\
        \
        {"text":"\uF805","font":"space"},\
        {"interpret":true,"nbt":"UI.Option.MoveJump","storage":"mhdp_core:temp"},\
        {"text":"\uF999\uF999\uF999\uF998","font":"space"},\
    ]

# UI表示
# 1：-6px 切れ味(44px) +4px 武器(40px) 空欄(53px) アイテム1(16px) +4px アイテム2(16px) : 計178px
# 2：-22px -200px 型表示(20) +180px +22px : 計0px
# 3：-204px タイマー(20px) -1px スタミナ(82px) +100px : 計-1px
# 4：-9px 狩技ゲージ1(41px) -2px 狩技ゲージ2(41px) : 計-1px
# 5：-89px 建築マーク(24px) -1px 建築ゲージ(82px) -1px : 計-1px
# 6：+7px ジャンプトグル(24px) -32px
    # title @s actionbar [\
    #     {"text":"\uF998\uF998\uF998\uF801","font":"space"},\
    #     {"interpret":true,"nbt":"UI.Sharpness","storage":"mhdp_core:temp"},\
    #     {"text":"\uF804","font":"space"},\
    #     {"text":"#","font":"ui/new_player_ui/weapon",shadow_color:[0,0,0,0]},\
    #     {"text":"\uF888\uF888\uF888\uF888\uF888\uF888\uF802\uF802\uF802\uF801","font":"space"},\
    #     {"interpret":true,"nbt":"UI.Item0","storage":"mhdp_core:temp"},\
    #     {"text":"\uF804","font":"space"},\
    #     {"interpret":true,"nbt":"UI.Item1","storage":"mhdp_core:temp"},\
    #     {"text":"\uF801","font":"space"},\
    #     \
    #     {"text":"\uF999\uF999\uF801\uF801\uF801","font":"space"},\
    #     {"text":"\uF815","font":"space"},\
    #     {"interpret":true,"nbt":"UI.Type","storage":"mhdp_core:temp"},\
    #     {"text":"\uF900\uF822","font":"space"},\
    #     {"text":"\uF888\uF888\uF802\uF802\uF802","font":"space"},\
    #     \
    #     {"text":"\uF815\uF998\uF998","font":"space"},\
    #     {"text":"#","font":"ui/new_player_ui/timer",shadow_color:[0,0,0,0]},\
    #     {"interpret":true,"nbt":"UI.Stamina","storage":"mhdp_core:temp"},\
    #     {"text":"\uF821\uF822","font":"space"},\
    #     \
    #     {"text":"\uF813\uF801","font":"space"},\
    #     {"interpret":true,"nbt":"UI.Arts1","storage":"mhdp_core:temp"},\
    #     {"text":"\uF998","font":"space"},\
    #     {"interpret":true,"nbt":"UI.Arts2","storage":"mhdp_core:temp"},\
    #     \
    #     {"text":"\uF813\uF998\uF998\uF998\uF801\uF801\uF801","font":"space"},\
    #     {"interpret":true,"nbt":"UI.Block","storage":"mhdp_core:temp"},\
    #     {"text":"\uF801","font":"space"},\
    #     {"interpret":true,"nbt":"UI.BuildGauge","storage":"mhdp_core:temp"},\
    #     {"text":"\uF801","font":"space"},\
    #     \
    #     {"text":"\uF805","font":"space"},\
    #     {"interpret":true,"nbt":"UI.Option.MoveJump","storage":"mhdp_core:temp"},\
    #     {"text":"\uF999\uF999\uF999\uF998","font":"space"},\
    # ]

# 終了
    data remove storage mhdp_core:temp UI
