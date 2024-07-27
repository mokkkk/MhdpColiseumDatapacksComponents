#> mhdp_core:player/damage/player_to_entity/vfx
#
# プレイヤーからモンスターに対してのダメージ処理 演出
#
# @within function mhdp_core:player/damage/player_to_entity/main

# 効果音
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

# 肉質に応じてヒットストップを減らす
    execute if score #mhdp_temp_defence_phys MhdpCore matches ..30 if score @s Wpn.HitStopTimer matches 3.. run scoreboard players set @s Wpn.HitStopTimer 2
    execute if score #mhdp_temp_defence_phys MhdpCore matches ..15 if score @s Wpn.HitStopTimer matches 2.. run scoreboard players set @s Wpn.HitStopTimer 1

# パーティクル
    execute if score #mhdp_temp_element_attack_value MhdpCore matches ..0 run scoreboard players set #mhdp_temp_damage_element_vfx_type MhdpCore 0
    execute if score #mhdp_temp_damage_phys_type MhdpCore matches 0 run particle block{block_state:"minecraft:red_wool"} ^ ^ ^ 0.1 0.1 0.1 0.5 15 normal
    execute if score #mhdp_temp_damage_phys_type MhdpCore matches 0 if score #mhdp_temp_defence_phys MhdpCore matches 45.. run particle dust_pillar{block_state:"minecraft:red_wool"} ^ ^ ^ 0.2 0.1 0.2 0.5 15 normal
    execute if score #mhdp_temp_damage_element_vfx_type MhdpCore matches 1 run particle flame ~ ~ ~ 0.2 0.2 0.2 0.05 10
    execute if score #mhdp_temp_damage_element_vfx_type MhdpCore matches 2 run particle rain ~ ~ ~ 0.2 0.2 0.2 0.15 20
    execute if score #mhdp_temp_damage_element_vfx_type MhdpCore matches 3 run particle electric_spark ~ ~ ~ 0.2 0.2 0.2 0.5 20
    execute if score #mhdp_temp_damage_element_vfx_type MhdpCore matches 4 run particle snowflake ~ ~ ~ 0.2 0.2 0.2 0.05 10 normal
    execute if score #mhdp_temp_damage_element_vfx_type MhdpCore matches 5 run particle dust_color_transition{from_color:[0.322,0.000,0.000],scale:1.5,to_color:[1.000,0.361,0.361]} ~ ~ ~ 0.3 0.3 0.3 0.15 10
    execute if score #mhdp_temp_condition_value_poison MhdpCore matches 1.. run particle dust{color:[0.502,0.016,0.710],scale:1.5} ~ ~ ~ 0.5 0.5 0.5 0.15 10
    execute if score #mhdp_temp_condition_value_paralysis MhdpCore matches 1.. run particle dust{color:[1.000,0.969,0.000],scale:1.5} ~ ~ ~ 0.5 0.5 0.5 0.15 10
    execute if score #mhdp_temp_condition_value_bomb MhdpCore matches 1.. run particle dust{color:[0.220,0.820,0.000],scale:1.5} ~ ~ ~ 0.5 0.5 0.5 0.15 10

# ヒットエフェクト
    # X軸方向のずれを修正
        scoreboard players set #mhdp_temp_vfx_offset MhdpCore 4
        execute if data storage mhdp_core:temp Damage.VfxScale store result score #mhdp_temp_vfx_offset MhdpCore run data get storage mhdp_core:temp Damage.VfxScale[0]
    # Z軸回転取得
        data modify storage mhdp_core:temp Arg.VfxRotation set from storage mhdp_core:temp Damage.VfxRotation
        execute if score #mhdp_temp_damage_phys_type MhdpCore matches 1 store result storage mhdp_core:temp Arg.VfxRotation int 1 run random value 0..360
    # 位置オフセット取得
        function mhdp_core:player/damage/player_to_entity/vfx_calc_offset
    # 表示
        # 斬撃
            execute if score #mhdp_temp_damage_phys_type MhdpCore matches 0 if data storage mhdp_core:temp Damage{IsShowVfx:true} positioned as @e[tag=Temp.Victim] facing entity @s feet run function mhdp_core:player/damage/player_to_entity/macro/m.summon_slash_effect with storage mhdp_core:temp Arg
        # 打撃
            execute if score #mhdp_temp_damage_phys_type MhdpCore matches 1 if data storage mhdp_core:temp Damage{IsShowVfx:true} positioned as @e[tag=Temp.Victim] facing entity @s feet run function mhdp_core:player/damage/player_to_entity/macro/m.summon_blow_effect with storage mhdp_core:temp Arg

# ダメージ表示
    function mhdp_core:player/damage/player_to_entity/vfx_show_damage
