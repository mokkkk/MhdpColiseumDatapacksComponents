#> mhdp_items:weapons/short_sword/type_normal/24_guard/end
#
# ガード 終了処理
#
# @within function mhdp_items:weapons/great_sword/type_normal/24_guard/main

# タグ消去
    tag @s remove Wpn.Ss.Normal.Guard
    tag @s remove Ply.Weapon.StaminaNotRegen
    tag @s remove Ply.Weapon.Guard

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 演出
    playsound item.armor.equip_iron master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1

# 共通処理
    function mhdp_items:weapons/short_sword/util/end_attack
