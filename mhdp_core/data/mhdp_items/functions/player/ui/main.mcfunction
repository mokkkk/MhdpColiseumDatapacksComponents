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

# スキル関連

# スタミナ
    function mhdp_items:player/ui/stamina/main

# UI表示
# -39px 斬れ味(60px+1px) +4px 武器(60px+1px) +4px アイテム1(16px+1px) +4px アイテム2(16px+1px) -70px スタミナ(80px+1px)
    title @s actionbar [{"text": "\uF999\uF999\uF821\uF999\uF999","font":"space"},{"interpret":true,"nbt":"UI.Sharpness","storage":"mhdp_core:temp"},{"text":"\uF804","font":"space"},{"interpret":true,"nbt":"UI.Weapon","storage":"mhdp_core:temp"},{"text":"\uF804","font":"space"},{"interpret":true,"nbt":"UI.Item0","storage":"mhdp_core:temp"},{"text":"\uF804","font":"space"},{"interpret":true,"nbt":"UI.Item1","storage":"mhdp_core:temp"},{"text": " \uF812\uF888\uF888"},{"interpret":true,"nbt":"UI.Stamina","storage":"mhdp_core:temp"}]

# 終了
    data remove storage mhdp_core:temp UI
