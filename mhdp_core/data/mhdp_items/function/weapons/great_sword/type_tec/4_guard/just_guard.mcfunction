#> mhdp_items:weapons/great_sword/type_tec/4_guard/just_guard
#
# ガード 開始
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# 演出
    execute positioned ~ ~1.65 ~ run particle flash ^ ^ ^0.2 0 0 0 0 1
    playsound item.shield.block master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.6
    playsound item.shield.block master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    playsound entity.experience_orb.pickup master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 3 1.3
    playsound entity.experience_orb.pickup master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 3 1.3

# スタミナ消費・のけぞりを最小化
    scoreboard players set #mhdp_temp_guard_stamina MhdpCore 0
    scoreboard players set @s Wpn.GuardStopTimer 1
    scoreboard players set #mhdp_temp_knockback_strength MhdpCore 0
    scoreboard players operation #mhdp_temp_damage_reduction MhdpCore /= #const_2 Const

# 後ずさる
    tp @s @s
    scoreboard players set $strength player_motion.api.launch 10000
    execute at @s rotated ~180 0 run function player_motion:api/launch_looking

# ジャストガードに移行
    # 前処理
        function mhdp_items:weapons/great_sword/util/before_attack
    # タグ付与
        tag @s add Wpn.Gs.Tec.Guard.Just
    # タイマー初期化
        scoreboard players set @s Wpn.GeneralTimer 0
