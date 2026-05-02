#> mhdp_items:weapons/lance/type_normal/11_charge_counter/guard
#
# 溜めカウンター ガード時
#
# @within function mhdp_items:weapons/great_sword/type_normal/main

# 威力値に応じてレベル設定
    execute if score #mhdp_temp_guard_value_original MhdpCore matches ..1 run scoreboard players set @s Wpn.Lc.RageLevel 1
    execute if score #mhdp_temp_guard_value_original MhdpCore matches 2..3 run scoreboard players set @s Wpn.Lc.RageLevel 2
    execute if score #mhdp_temp_guard_value_original MhdpCore matches 4.. run scoreboard players set @s Wpn.Lc.RageLevel 3
    scoreboard players set @s Wpn.Lc.RageTimer 600

# 演出
    playsound item.shield.block master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.6
    playsound item.shield.block master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    playsound entity.experience_orb.pickup master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 3 1.3
    playsound entity.experience_orb.pickup master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 3 1.3
    playsound entity.blaze.hurt master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    playsound entity.blaze.hurt master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.6
    playsound entity.iron_golem.death master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.2
    execute at @s anchored eyes positioned ^ ^ ^1 run function mhdp_items:weapons/lance/type_normal/22_guard_rage/particle_guard

# 後ずさる
    execute at @s rotated ~180 0 run function api:weapon_operation/use_player_motion.m {Strength:6000, IsForce:false, IsAdjust:false}

# のけぞり最小化
    scoreboard players set #mhdp_temp_knockback_strength MhdpCore 0
    scoreboard players set @s Wpn.GuardStopTimer 10

# 自動カウンターに移行
    tag @s remove Ply.Weapon.Guard
    function mhdp_items:weapons/lance/type_normal/23_rage_counter/start
