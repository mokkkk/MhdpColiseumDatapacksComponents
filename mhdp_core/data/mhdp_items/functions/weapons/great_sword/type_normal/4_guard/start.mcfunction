#> mhdp_items:weapons/great_sword/type_normal/4_guard/start
#
# ガード 開始
#
# @within function mhdp_items:weapons/great_sword/type_normal/main

# タグ付与
    tag @s add Wpn.Gs.Normal.Guard
    tag @s add Ply.Weapon.Guard

# attribute設定
    attribute @s generic.jump_strength modifier remove f-f-f-a-3
    attribute @s generic.jump_strength modifier add f-f-f-a-3 "武器の個別ジャンプ力" -1 add_value

# スタミナ回復停止
    tag @s add Ply.Weapon.StaminaNotRegen

# 演出
    playsound item.armor.equip_iron master @s ~ ~ ~ 2 1

# タイマー初期化
    scoreboard players set @s Wpn.GuardStopTimer 0

say ガード