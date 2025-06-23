#> mhdp_items:weapons/great_sword/type_normal/4_guard/start
#
# ガード 開始
#
# @within function mhdp_items:weapons/great_sword/type_normal/main

# 前処理
    function mhdp_items:weapons/great_sword/util/before_attack

# タグ付与
    tag @s add Wpn.Gs.Normal.Guard
    tag @s add Ply.Weapon.Guard
    tag @s remove Ply.Weapon.NoOpe

# スタミナ回復停止
    tag @s add Ply.Weapon.StaminaNotRegen

# 演出
    playsound item.armor.equip_iron master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1

# タイマー初期化
    scoreboard players set @s Wpn.GuardStopTimer 0

# say 武器操作：大剣・ガード