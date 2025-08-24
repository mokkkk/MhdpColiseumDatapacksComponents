#> mhdp_items:weapons/great_sword/type_tec/18_charge_high_quick/start
#
# 高速強溜め 開始
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# タグ付与
    tag @s add Wpn.Gs.Tec.Charge.Quick

# 狩技効果終了
    tag @s remove Ply.Weapon.UsingArts.1
    scoreboard players set @s Ply.Stats.Arts.1 0

# attribute設定
    attribute @s jump_strength modifier add mhdp_core:weapon_jump_strength -1.0 add_value

# その他初期化
    scoreboard players set @s Wpn.Gs.ChargeTimer 0
    scoreboard players set @s Wpn.Gs.ChargeCount 0
    scoreboard players set @s Wpn.Gs.ChargeSlashCount 1

# say 武器操作：大剣・溜め
