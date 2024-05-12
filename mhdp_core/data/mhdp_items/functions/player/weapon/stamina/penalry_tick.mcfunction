#> mhdp_items:player/weapon/stamina/penalry_tick
#
# スタミナを使い切った際の処理
#
# @within function mhdp_items:player/weapon/stamina/main

# タイマー減少
    execute if score @s Ply.Stats.StaminaPenaltyTimer matches 1.. run scoreboard players remove @s Ply.Stats.StaminaPenaltyTimer 1

# 移動速度減少
    execute if entity @s[tag=Ply.Ope.IsSprinting] run attribute @s generic.movement_speed modifier add f-f-f-f-4 "スタミナペナルティ中移動速度減少" -0.023 add_value
    execute if entity @s[tag=!Ply.Ope.IsSprinting] run attribute @s generic.movement_speed modifier remove f-f-f-f-4

# 回復開始
    execute if score @s Ply.Stats.StaminaPenaltyTimer matches ..0 run scoreboard players add @s Ply.Stats.Stamina 80
    execute if score @s Ply.Stats.Stamina matches 1000.. run function mhdp_items:player/weapon/stamina/penalry_end
