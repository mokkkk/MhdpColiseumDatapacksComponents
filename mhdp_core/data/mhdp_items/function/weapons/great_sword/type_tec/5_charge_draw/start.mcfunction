#> mhdp_items:weapons/great_sword/type_tec/5_charge_draw/start
#
# 溜め 開始
#
# @within function mhdp_items:weapons/great_sword/type_tec/0_drawattack/start

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# タグ付与
    tag @s add Wpn.Gs.Tec.Charge
    tag @s add Ply.Flag.DrawAttack
    tag @s remove Ply.Weapon.NoOpe

# attribute設定
    attribute @s jump_strength modifier add mhdp_core:weapon_jump_strength -1.0 add_value

# その他初期化
    scoreboard players set @s Wpn.Gs.ChargeTimer 0
    scoreboard players set @s Wpn.Gs.ChargeCount 0
    scoreboard players set @s Wpn.Gs.ChargeSlashCount 0

# 空中で使用した場合、少し飛ぶ
    execute if entity @s[tag=!Ply.Ope.IsAir,nbt={OnGround:0b}] run function mhdp_items:weapons/great_sword/type_tec/5_charge_draw/start_jump

# say 武器操作：大剣・抜刀溜め