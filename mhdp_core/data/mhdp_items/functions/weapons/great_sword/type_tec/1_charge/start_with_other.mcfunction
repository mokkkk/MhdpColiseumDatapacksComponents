#> mhdp_items:weapons/great_sword/type_tec/1_charge/start_with_other
#
# 溜め 開始
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# タグ付与
    tag @s add Wpn.Gs.Tec.Charge

# attribute設定
    attribute @s generic.jump_strength modifier add f-f-f-a-3 "武器の個別ジャンプ力" -1.0 add_value

# その他初期化
    scoreboard players set @s Wpn.Gs.ChargeTimer 0
    scoreboard players set @s Wpn.Gs.ChargeCount 0
    scoreboard players add @s Wpn.Gs.ChargeSlashCount 1

say 大剣・溜め