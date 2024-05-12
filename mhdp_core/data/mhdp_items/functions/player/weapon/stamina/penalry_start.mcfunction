#> mhdp_items:player/weapon/stamina/penalry_start
#
# スタミナを使い切った際の処理 開始
#
# @within function mhdp_items:player/weapon/stamina/main

# ペナルティ開始
    tag @s add Ply.Weapon.StaminaEmpty
    scoreboard players set @s Ply.Stats.StaminaPenaltyTimer 100

# ジャンプ不可
    attribute @s generic.jump_strength modifier add f-f-f-f-3 "スタミナペナルティ中ジャンプ不可" -10 add_value
