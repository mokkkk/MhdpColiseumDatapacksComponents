#> mhdp_items:weapons/lance/type_tec/12_counter_spear/guard
#
# カウンター突き ジャストガード判定
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# 演出
    execute at @s positioned ~ ~1.65 ~ run particle flash{color:[1.000,1.000,1.000,1.00]} ^ ^ ^0.2 0 0 0 0 1
    playsound item.shield.block master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.6
    playsound item.shield.block master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    playsound entity.experience_orb.pickup master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 3 1.3
    playsound entity.experience_orb.pickup master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 3 1.3

# スタミナ消費・のけぞりを最小化
    scoreboard players set #mhdp_temp_guard_stamina MhdpCore 0
    scoreboard players set @s Wpn.GuardStopTimer 1
    scoreboard players set #mhdp_temp_knockback_strength MhdpCore 0

# 後ずさる
    execute at @s rotated ~180 0 run function api:weapon_operation/use_player_motion.m {Strength:8000, IsForce:false, IsAdjust:false}

# ダメージ無効化
    scoreboard players set #mhdp_temp_damage_reduction MhdpCore 0

# 短時間無敵化
    scoreboard players set @s Ply.Timer.DamageInterval 6

# カウンター2連突きに移行
    # 前処理
        function mhdp_items:weapons/lance/util/before_attack
    # タグ付与
        tag @s remove Wpn.Lc.Tec.CounterSpear
        tag @s remove Ply.Weapon.Guard
    # タイマー初期化
        scoreboard players set @s Wpn.GeneralTimer 0
    # 開始
        function mhdp_items:weapons/lance/type_tec/14_counter_double_spear/start
