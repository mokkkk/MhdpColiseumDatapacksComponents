#> mhdp_items:weapons/great_sword/type_normal/1_charge/start_from_tackle
#
# 溜め 開始
#
# @within function mhdp_items:weapons/great_sword/type_normal/main

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# タグ付与
    tag @s add Wpn.Gs.Normal.Charge
    tag @s remove Ply.Weapon.NoOpe

# attribute設定
    attribute @s jump_strength modifier add mhdp_core:weapon_jump_strength -1.0 add_value

# その他初期化
    scoreboard players set @s Wpn.Gs.ChargeTimer 0

# say 武器操作：大剣・溜め