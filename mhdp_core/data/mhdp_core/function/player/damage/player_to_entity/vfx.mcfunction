#> mhdp_core:player/damage/player_to_entity/vfx
#
# プレイヤーからモンスターに対してのダメージ処理 演出
#
# @within function mhdp_core:player/damage/player_to_entity/main

# 効果音
    playsound minecraft:entity.generic.hurt master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score #mhdp_temp_damage_phys_type MhdpCore matches 0 run playsound minecraft:entity.player.attack.knockback master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score #mhdp_temp_damage_phys_type MhdpCore matches 0 run playsound minecraft:entity.player.hurt_sweet_berry_bush master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.8
    execute if score #mhdp_temp_damage_phys_type MhdpCore matches 1 run playsound minecraft:entity.player.attack.knockback master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.5
    execute if score #mhdp_temp_damage_phys_type MhdpCore matches 1 run playsound minecraft:entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1
    execute if score #mhdp_temp_damage_phys_type MhdpCore matches 1 run playsound minecraft:entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.5
    execute if score #mhdp_temp_damage_phys_type MhdpCore matches 2 run playsound minecraft:entity.player.attack.crit master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1.8
    execute if score #mhdp_temp_damage_phys_type MhdpCore matches 2 run playsound minecraft:entity.player.attack.weak master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1.2

# パーティクル
    execute if score #mhdp_temp_damage_element_vfx_type MhdpCore matches 0 run particle enchanted_hit ~ ~ ~ 0.1 0.1 0.1 1 50
    execute if score #mhdp_temp_damage_element_vfx_type MhdpCore matches 1 run particle flame ~ ~ ~ 0.2 0.2 0.2 0.05 10
    execute if score #mhdp_temp_damage_element_vfx_type MhdpCore matches 2 run particle rain ~ ~ ~ 0.2 0.2 0.2 0.15 20
    execute if score #mhdp_temp_damage_element_vfx_type MhdpCore matches 3 run particle electric_spark ~ ~ ~ 0.2 0.2 0.2 0.15 10
    execute if score #mhdp_temp_damage_element_vfx_type MhdpCore matches 4 run particle snowflake ~ ~ ~ 0.2 0.2 0.2 0.05 10 normal
    execute if score #mhdp_temp_damage_element_vfx_type MhdpCore matches 5 run particle dust_color_transition{from_color:[0.322,0.000,0.000],scale:1.5,to_color:[1.000,0.361,0.361]} ~ ~ ~ 0.3 0.3 0.3 0.15 10

# ダメージ表示
    execute if score #mhdp_temp_defence_phys MhdpCore matches ..44 run data modify storage mhdp_core:temp Arg.Tag set value "Normal"
    execute if score #mhdp_temp_defence_phys MhdpCore matches 45.. run data modify storage mhdp_core:temp Arg.Tag set value "Weak"
    execute if score #mhdp_temp_defence_phys MhdpCore matches ..44 run data modify storage mhdp_core:temp Arg.Color set value "white"
    execute if score #mhdp_temp_defence_phys MhdpCore matches 45.. run data modify storage mhdp_core:temp Arg.Color set value "#FF6F00"
    execute if score #mhdp_temp_defence_phys MhdpCore matches ..44 run data modify storage mhdp_core:temp Arg.Scale set value 1.0
    execute if score #mhdp_temp_defence_phys MhdpCore matches 45.. run data modify storage mhdp_core:temp Arg.Scale set value 1.0
    execute store result storage mhdp_core:temp Arg.Damage int 1 run scoreboard players get #mhdp_temp_damage_total MhdpCore
    function mhdp_core:player/damage/player_to_entity/macro/m.summon_damage_text with storage mhdp_core:temp Arg
