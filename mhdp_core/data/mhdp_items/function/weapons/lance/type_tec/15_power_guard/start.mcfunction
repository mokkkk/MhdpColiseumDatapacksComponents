#> mhdp_items:weapons/lance/type_tec/15_power_guard/start
#
# パワーガード 開始
#
# @within function mhdp_items:weapons/lance/type_tec/main

# 前処理
    function mhdp_items:weapons/lance/util/before_attack

# タグ付与
    tag @s add Wpn.Lc.Tec.PowerGuard
    tag @s add Ply.Weapon.Guard
    tag @s remove Ply.Weapon.NoOpe

# スタミナ回復停止
    tag @s add Ply.Weapon.StaminaNotRegen

# 演出
    playsound item.armor.equip_iron master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1

# タイマー初期化
    scoreboard players set @s Wpn.GuardStopTimer 5
