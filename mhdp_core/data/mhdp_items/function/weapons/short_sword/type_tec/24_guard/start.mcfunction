#> mhdp_items:weapons/great_sword/type_tec/4_guard/start
#
# ガード 開始
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# タグ付与
    tag @s add Wpn.Ss.Tec.Guard
    tag @s add Ply.Weapon.Guard

# attribute設定
    attribute @s generic.jump_strength modifier remove mhdp_core:weapon_jump_strength
    attribute @s generic.jump_strength modifier add mhdp_core:weapon_jump_strength -1 add_value

# スタミナ回復停止
    tag @s add Ply.Weapon.StaminaNotRegen

# 演出
    playsound item.armor.equip_iron master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1

# タイマー初期化
    scoreboard players set @s Wpn.GuardStopTimer 0

say ガード