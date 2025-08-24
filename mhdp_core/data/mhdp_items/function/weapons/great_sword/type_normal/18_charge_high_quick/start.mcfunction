#> mhdp_items:weapons/great_sword/type_normal/18_charge_high_quick/start
#
# 高速強溜め 開始
#
# @within function mhdp_items:weapons/great_sword/type_normal/main

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# タグ付与
    tag @s add Wpn.Gs.Normal.Charge.Quick

# 狩技効果終了
    tag @s remove Ply.Weapon.UsingArts.1
    scoreboard players set @s Ply.Stats.Arts.1 0

# attribute設定
    attribute @s jump_strength modifier add mhdp_core:weapon_jump_strength -1.0 add_value

# その他初期化
    scoreboard players set @s Wpn.Gs.ChargeTimer 0
    scoreboard players set @s Wpn.Gs.ChargeCount 0
    scoreboard players set @s Wpn.Gs.ChargeSlashCount 1

# 空中で使用した場合、少し飛ぶ
    execute if entity @s[tag=!Ply.Ope.IsAir,nbt={OnGround:0b}] run function mhdp_items:weapons/great_sword/type_normal/5_charge_draw/start_jump

# say 武器操作：大剣・溜め
