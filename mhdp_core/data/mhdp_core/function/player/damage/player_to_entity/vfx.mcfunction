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
