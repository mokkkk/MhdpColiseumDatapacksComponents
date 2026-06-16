#> mhdp_items:weapons/long_sword/type_normal/9_sacred_slash/counter
#
# 威合抜刀斬り カウンター成功
#
# @within function mhdp_items:weapons/long_sword/type_normal/1_charge/change_to_chargeattack

# 短時間無敵化
    scoreboard players set @s Ply.Timer.DamageInterval 6

# カウンターフラグ有効
    tag @s add Ply.Flag.CounterSuccess

# 練気を最大にする
    scoreboard players set @s Wpn.Ls.SpiritGauge 1000

# 演出
    playsound entity.experience_orb.pickup master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1.3
    playsound block.anvil.land master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1.7
    playsound block.anvil.land master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 2
    playsound item.trident.return master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    playsound item.trident.return master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.9
    execute anchored eyes run particle firework ^ ^ ^1 0 0 0 0.4 10
    execute anchored eyes run particle crit ^ ^ ^1 0 0 0 1 20

# 移動
    execute rotated ~180 0 run function api:weapon_operation/use_player_motion.m {Strength:5000, IsForce:false, IsAdjust:false}
