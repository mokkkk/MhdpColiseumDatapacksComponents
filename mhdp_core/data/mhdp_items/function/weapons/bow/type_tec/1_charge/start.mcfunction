#> mhdp_items:weapons/bow/type_tec/1_charge/start
#
# 溜め 開始
#
# @within function mhdp_items:weapons/bow/type_tec/main

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# タグ付与
    tag @s add Wpn.Bw.Tec.Charge

# attribute設定
    attribute @s generic.jump_strength modifier add mhdp_core:weapon_jump_strength -1.0 add_value

# その他初期化
    # scoreboard players set @s Wpn.Gs.ChargeTimer 0
    # scoreboard players set @s Wpn.Gs.ChargeCount 0
    # scoreboard players set @s Wpn.Gs.ChargeSlashCount 0

say 弓・溜め