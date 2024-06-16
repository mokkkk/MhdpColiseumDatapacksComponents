#> mhdp_items:weapons/great_sword/type_tec/4_guard/end
#
# ガード 終了処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/4_guard/main

# タグ消去
    tag @s remove Wpn.Gs.Tec.Guard
    tag @s remove Ply.Weapon.StaminaNotRegen
    tag @s remove Ply.Weapon.Guard

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 演出
    playsound item.armor.equip_iron master @s ~ ~ ~ 2 1

# 共通処理
    function mhdp_items:weapons/great_sword/util/end_attack
