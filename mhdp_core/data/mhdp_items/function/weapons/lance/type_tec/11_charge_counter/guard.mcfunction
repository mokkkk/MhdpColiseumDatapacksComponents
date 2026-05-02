#> mhdp_items:weapons/lance/type_tec/11_charge_counter/guard
#
# 溜めカウンター ガード時
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# 演出
    playsound item.shield.block master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.6
    playsound item.shield.block master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5

# 後ずさる
    execute if score #mhdp_temp_knockback_strength MhdpCore matches ..2 at @s rotated ~180 0 run function api:weapon_operation/use_player_motion.m {Strength:8000, IsForce:false, IsAdjust:false}
    execute if score #mhdp_temp_knockback_strength MhdpCore matches 3.. at @s rotated ~180 0 run function api:weapon_operation/use_player_motion.m {Strength:16000, IsForce:false, IsAdjust:false}

# のけぞり最小化
    scoreboard players set #mhdp_temp_knockback_strength MhdpCore 0

# ガードストップタイマー減算
    scoreboard players remove @s Wpn.GuardStopTimer 16
    execute if score @s Wpn.GuardStopTimer matches ..3 run scoreboard players set @s Wpn.GuardStopTimer 3

# 自動カウンターに移行
    # 前処理
        function mhdp_items:weapons/lance/util/before_attack
    # タグ付与
        tag @s remove Wpn.Lc.Tec.Guard
        tag @s remove Ply.Weapon.Guard
        tag @s remove Ply.Weapon.StaminaNotRegen
        tag @s add Wpn.Lc.Tec.AutoCounter
    # タイマー初期化
        scoreboard players set @s Wpn.GeneralTimer 0
