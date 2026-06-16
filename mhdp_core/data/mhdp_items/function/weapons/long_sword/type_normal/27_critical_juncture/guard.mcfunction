#> mhdp_items:weapons/long_sword/type_normal/27_critical_juncture/guard
#
# 鏡花の構え ガード時
#
# @within function mhdp_items:weapons/great_sword/type_normal/main

# 演出
    playsound item.shield.block master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.6
    playsound item.shield.block master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    playsound entity.experience_orb.pickup master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 3 1.3
    playsound entity.experience_orb.pickup master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 3 1.3
    playsound entity.blaze.hurt master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    playsound entity.blaze.hurt master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.6

# のけぞり・ダメージ無効化
    scoreboard players set #mhdp_temp_damage_reduction MhdpCore 0
    scoreboard players set #mhdp_temp_knockback_strength MhdpCore 0
    scoreboard players set @s Wpn.GuardStopTimer 0

# 短時間無敵化
    scoreboard players set @s Ply.Timer.DamageInterval 6

# ジャストカウンター成功の場合、練気色段階を上昇
    execute if score @s Wpn.GeneralTimer matches ..6 run function mhdp_items:weapons/long_sword/util/up_spirit_level

# カウンターに移行
    tag @s remove Ply.Weapon.Guard
    function mhdp_items:weapons/long_sword/type_normal/28_critical_juncture_counter/start
