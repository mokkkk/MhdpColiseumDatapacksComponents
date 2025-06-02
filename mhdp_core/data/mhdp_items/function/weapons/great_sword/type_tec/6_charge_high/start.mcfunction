#> mhdp_items:weapons/great_sword/type_tec/1_charge/start
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
    attribute @s jump_strength modifier add mhdp_core:weapon_jump_strength -1.0 add_value

# その他初期化
    scoreboard players set @s Wpn.Gs.ChargeTimer 0
    scoreboard players set @s Wpn.Gs.ChargeCount 0
    scoreboard players set @s Wpn.Gs.ChargeSlashCount 0

# say 武器操作：大剣・溜め

say 未使用処理