#> mhdp_items:weapons/short_sword/type_tec/30_upper_bash/counter_success
#
# 滅・昇竜撃 カウンター成功
#
# @within function mhdp_items:weapons/great_sword/type_tec/30_upper_bash/change_to_chargeattack

# 演出
    execute positioned ~ ~1.65 ~ run particle flash ^ ^ ^0.2 0 0 0 0 1
    playsound item.shield.block master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.6
    playsound item.shield.block master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    playsound entity.experience_orb.pickup master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 3 1.3
    playsound entity.experience_orb.pickup master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 3 1.3

# スタミナ消費を無効化
    scoreboard players set #mhdp_temp_guard_stamina MhdpCore 0

# カウンター成功
    tag @s add Ply.Flag.Ss.UpperBashCounter
