#> mhdp_items:weapons/lance/type_normal/8_guard_charge/start_from_just_guard
#
# 溜めカウンター 開始
#
# @within function mhdp_items:weapons/lance/type_normal/1_charge/change_to_chargeattack

# 前処理
    function mhdp_items:weapons/lance/util/before_attack

# タグ付与
    tag @s add Wpn.Lc.Normal.GuardCharge
    tag @s remove Ply.Weapon.NoOpe
    tag @s add Ply.Weapon.Guard
    tag @s add Ply.Weapon.StaminaNotRegen

# 溜め段階初期化
    scoreboard players set @s Wpn.Lc.ChargeTimer 144
    scoreboard players set @s Wpn.Lc.ChargeCount 0
