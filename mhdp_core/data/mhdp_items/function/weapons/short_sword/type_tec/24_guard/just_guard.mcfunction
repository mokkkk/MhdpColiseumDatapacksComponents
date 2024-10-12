#> mhdp_items:weapons/short_sword/type_tec/24_guard/just_guard
#
# ガード ジャストガード成功
#
# @within function mhdp_items:weapons/short_sword/util/guard

# 演出
    execute positioned ~ ~1.65 ~ run particle flash ^ ^ ^0.2 0 0 0 0 1
    playsound item.shield.block master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.6
    playsound item.shield.block master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    playsound entity.experience_orb.pickup master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 3 1.3
    playsound entity.experience_orb.pickup master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 3 1.3

# スタミナ消費・のけぞりを最小化
    scoreboard players set #mhdp_temp_guard_stamina MhdpCore 0
    scoreboard players set @s Wpn.GuardStopTimer 1
    scoreboard players set #mhdp_temp_knockback_strength MhdpCore 1
    scoreboard players operation #mhdp_temp_damage_reduction MhdpCore /= #const_2 Const

# ジャストガードに移行
    # タグ付与
        tag @s remove Wpn.Ss.Tec.Guard
        tag @s add Wpn.Ss.Tec.Guard.Just
    # タイマー初期化
        scoreboard players set @s Wpn.GeneralTimer 0
