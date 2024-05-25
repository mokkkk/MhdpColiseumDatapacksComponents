#> mhdp_items:weapons/great_sword/type_normal/0_drawattack/start
#
# 抜刀攻撃 開始
#
# @within function mhdp_items:weapons/great_sword/type_normal/main

# メインハンドが空の場合のみ実行
    execute if items entity @s weapon.mainhand * run say 抜刀攻撃失敗
    execute if items entity @s weapon.mainhand * run return 0

# 強制抜刀
    function mhdp_items:player/weapon/sheathe/force_drawing

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# タグ付与
    tag @s add Wpn.Gs.Normal.Charge

# attribute設定
    attribute @s generic.jump_strength modifier add f-f-f-a-3 "武器の個別ジャンプ力" -1.0 add_value

# その他初期化
    scoreboard players set @s Wpn.Gs.ChargeTimer 0
    scoreboard players set @s Wpn.Gs.ChargeCount 0

say 大剣・抜刀溜め