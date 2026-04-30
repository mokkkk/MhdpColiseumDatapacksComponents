#> mhdp_items:weapons/lance/type_tec/11_charge_counter/start
#
# 溜めカウンター 開始
#
# @within function mhdp_items:weapons/lance/type_tec/1_charge/change_to_chargeattack

# 前処理
    function mhdp_items:weapons/lance/util/before_attack

# タグ付与
    tag @s add Wpn.Lc.Tec.ChargeCounter
    tag @s remove Ply.Weapon.NoOpe
    tag @s add Ply.Weapon.Guard
    tag @s add Ply.Weapon.StaminaNotRegen

# 溜め段階初期化
    scoreboard players set @s Wpn.Lc.ChargeTimer 0
    scoreboard players set @s Wpn.Lc.ChargeCount 0

# 直前の攻撃に応じて溜め段階の初期値を変える
    execute if score @s Wpn.Lc.SpearCount matches 1 run scoreboard players set @s Wpn.Lc.ChargeTimer 301
    execute if score @s Wpn.Lc.SpearCount matches 1 run scoreboard players set @s Wpn.Lc.ChargeCount 1
    execute if score @s Wpn.Lc.SpearCount matches 2 run scoreboard players set @s Wpn.Lc.ChargeTimer 601
    execute if score @s Wpn.Lc.SpearCount matches 2 run scoreboard players set @s Wpn.Lc.ChargeCount 2
