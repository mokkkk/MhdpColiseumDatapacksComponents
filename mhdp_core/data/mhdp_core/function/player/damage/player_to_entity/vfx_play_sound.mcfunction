#> mhdp_core:player/damage/player_to_entity/vfx_play_sound
#
# プレイヤーからモンスターに対してのダメージ処理 演出 効果音再生
#
# @within function mhdp_core:player/damage/player_to_entity/vfx

# 効果音
    data modify storage mhdp_core:temp IsPlayedHitSound set value true
    playsound minecraft:entity.generic.hurt master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score #mhdp_temp_defence_phys MhdpCore matches 31.. run playsound minecraft:entity.player.attack.strong master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.3
    execute if score #mhdp_temp_damage_phys_type MhdpCore matches 0 run playsound minecraft:entity.player.attack.knockback master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score #mhdp_temp_damage_phys_type MhdpCore matches 0 run playsound minecraft:entity.player.hurt_sweet_berry_bush master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.8
    execute if score #mhdp_temp_damage_phys_type MhdpCore matches 1 run playsound minecraft:entity.player.attack.knockback master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1.2
    execute if score #mhdp_temp_damage_phys_type MhdpCore matches 1 run playsound minecraft:entity.player.attack.knockback master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.5
    execute if score #mhdp_temp_damage_phys_type MhdpCore matches 1 run playsound minecraft:entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1.4
    execute if score #mhdp_temp_damage_phys_type MhdpCore matches 1 run playsound minecraft:entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1.5
    execute if score #mhdp_temp_damage_phys_type MhdpCore matches 1 run playsound item.wolf_armor.damage master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 2
    execute if score #mhdp_temp_damage_phys_type MhdpCore matches 2 run playsound minecraft:entity.player.attack.crit master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1.8
    execute if score #mhdp_temp_damage_phys_type MhdpCore matches 2 run playsound minecraft:entity.player.attack.weak master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1.2
    execute if score #mhdp_temp_damage_phys_type MhdpCore matches 2 run playsound item.trident.hit master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.5
    execute if score #mhdp_temp_damage_phys_type MhdpCore matches 2 run playsound item.trident.hit master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7
