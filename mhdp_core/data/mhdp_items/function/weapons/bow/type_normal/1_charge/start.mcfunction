#> mhdp_items:weapons/bow/type_normal/1_charge/start
#
# 溜め 開始
#
# @within function mhdp_items:weapons/bow/type_normal/main

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# タグ付与
    tag @s add Wpn.Bw.Normal.Charge
    tag @s remove Ply.Weapon.NoOpe

# attribute設定
    attribute @s generic.jump_strength modifier add mhdp_core:weapon_jump_strength -0.35 add_value

# スタミナ消費
    tag @s add Ply.Weapon.StaminaNotRegen
    
# その他初期化
    scoreboard players set @s Wpn.Bw.ChargeTimer 0
    scoreboard players set @s Wpn.Bw.ChargeCount 0

# say 武器操作：弓・溜め