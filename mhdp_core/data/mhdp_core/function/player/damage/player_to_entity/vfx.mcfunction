#> mhdp_core:player/damage/player_to_entity/vfx
#
# プレイヤーからモンスターに対してのダメージ処理 演出
#
# @within function 

# 効果音
    execute if score #mhdp_temp_damage_phys_type MhdpCore matches 1 run playsound minecraft:entity.player.attack.knockback master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1.5
    execute if score #mhdp_temp_damage_phys_type MhdpCore matches 1 run playsound minecraft:entity.player.hurt_sweet_berry_bush master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1
    execute if score #mhdp_temp_damage_phys_type MhdpCore matches 2 run playsound minecraft:entity.player.attack.knockback master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7
    execute if score #mhdp_temp_damage_phys_type MhdpCore matches 2 run playsound minecraft:item.mace.smash_air master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 2
    execute if score #mhdp_temp_damage_phys_type MhdpCore matches 3 run playsound minecraft:entity.player.attack.crit master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1.8
    execute if score #mhdp_temp_damage_phys_type MhdpCore matches 3 run playsound minecraft:entity.player.attack.weak master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1.2

# パーティクル
    execute if score #mhdp_temp_damage_phys_type MhdpCore matches 1 run particle flame ~ ~ ~ 0.2 0.2 0.2 0.05 10
    execute if score #mhdp_temp_damage_phys_type MhdpCore matches 2 run particle rain ~ ~ ~ 0.2 0.2 0.2 0.15 20
    execute if score #mhdp_temp_damage_phys_type MhdpCore matches 3 run particle electric_spark ~ ~ ~ 0.2 0.2 0.2 0.15 10
    execute if score #mhdp_temp_damage_phys_type MhdpCore matches 4 run particle snowflake ~ ~ ~ 0.2 0.2 0.2 0.05 10 normal
    execute if score #mhdp_temp_damage_phys_type MhdpCore matches 5 run particle dust_color_transition{from_color:[0.322,0.000,0.000],scale:1.5,to_color:[1.000,0.361,0.361]} ~ ~ ~ 0.3 0.3 0.3 0.15 10

# ダメージ表示
    # #mhdp_temp_damage_total MhdpCore
