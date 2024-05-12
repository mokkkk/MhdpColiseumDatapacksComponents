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
    # function mhdp_weapons:ui/ex/

# アイテム
    # function mhdp_weapons:ui/item/

# スタミナ
    function mhdp_items:player/ui/stamina/main

# UI表示
# -39 斬れ味 +4 特殊 +4 アイテム1 +4 アイテム2 -70 スタミナ
    # title @s actionbar ["",{"text": "\uF999\uF999\uF821\uF999\uF999"},{"interpret":true,"nbt":"Temp.UI.Sharpness","storage":"mhdp_core:temp"},{"text": " "},{"interpret":true,"nbt":"Temp.UI.Ex","storage":"mhdp_core:temp"},{"text": " "},{"interpret":true,"nbt":"Temp.UI.Item0","storage":"mhdp_core:temp"},{"text": " "},{"interpret":true,"nbt":"Temp.UI.Item1","storage":"mhdp_core:temp"},{"text": " \uF812\uF888\uF888"},{"interpret":true,"nbt":"Temp.UI.Stamina","storage":"mhdp_core:temp"}]
    
    title @s actionbar [{"interpret":true,"nbt":"UI.Sharpness","storage":"mhdp_core:temp"},{"text": "    ","font": "default"},{"interpret":true,"nbt":"UI.Stamina","storage":"mhdp_core:temp"}]
    # title @s actionbar [{"interpret":true,"nbt":"UI.Sharpness","storage":"mhdp_core:temp"}]

# 終了
    data remove storage mhdp_core:temp UI
