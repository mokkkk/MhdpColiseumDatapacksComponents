#> mhdp_items:weapons/great_sword/type_normal/1_charge/start
#
# 溜め 開始
#
# @within function mhdp_items:weapons/great_sword/type_normal/main

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# タグ付与
    tag @s add Wpn.Gs.Normal.Charge

# attribute設定
    attribute @s generic.jump_strength modifier add f-f-f-a-3 "武器の個別ジャンプ力" -0.3 add_value

# その他初期化
    scoreboard players set @s Wpn.Gs.ChargeTimer 0
    scoreboard players set @s Wpn.Gs.ChargeCount 0

say 大剣・溜め