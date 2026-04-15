#> mhdp_items:weapons/lance/type_tec/7_guard_dash/start
#
# ガード 開始
#
# @within function mhdp_items:weapons/lance/type_tec/main

# スタミナが不足している場合、使用不可
    execute unless score @s Ply.Stats.Stamina matches 1.. run return 0

# 前処理
    function mhdp_items:weapons/lance/util/before_attack

# タグ付与
    tag @s add Wpn.Lc.Tec.GuardDash
    tag @s add Ply.Weapon.Guard
    tag @s remove Ply.Weapon.NoOpe

# スタミナ消費
    tag @s add Ply.Weapon.StaminaNotRegen
    scoreboard players remove @s Ply.Stats.Stamina 150

# タイマー初期化
    scoreboard players set @s Wpn.GuardStopTimer 2
