#> mhdp_items:weapons/lance/type_tec/15_power_guard/guard
#
# パワーガード ガード時
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# 演出
    playsound item.shield.block master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.6
    playsound item.shield.block master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5

# のけぞりが小さい場合、最小化
    execute if score #mhdp_temp_knockback_strength MhdpCore matches ..2 run scoreboard players set #mhdp_temp_knockback_strength MhdpCore 0
    execute if score #mhdp_temp_knockback_strength MhdpCore matches 3.. run scoreboard players set #mhdp_temp_knockback_strength MhdpCore 1

# スタミナ消費最小化
    scoreboard players set #mhdp_temp_guard_stamina MhdpCore 0
    scoreboard players set @s Wpn.GuardStopTimer 10

# 後ずさる
    execute if score #mhdp_temp_knockback_strength MhdpCore matches 0 at @s rotated ~180 0 run function api:weapon_operation/use_player_motion.m {Strength:4000, IsForce:false, IsAdjust:false}
