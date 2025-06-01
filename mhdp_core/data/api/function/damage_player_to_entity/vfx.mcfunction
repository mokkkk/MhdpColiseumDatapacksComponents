#> api:damage_player_to_entity/vfx
#
# 攻撃演出
#
# @input storage api: Arg.

# 効果音再生
    execute if data storage mhdp_core:temp {IsPlayedHitSound:false} run function api:damage_player_to_entity/vfx/play_sound

# 肉質が硬い場合、ヒットストップ時間を短縮
    execute if score #mhdp_temp_defence_phys MhdpCore matches ..30 if score @s Wpn.HitStopTimer matches 3.. run scoreboard players set @s Wpn.HitStopTimer 2
    execute if score #mhdp_temp_defence_phys MhdpCore matches ..15 if score @s Wpn.HitStopTimer matches 2.. run scoreboard players set @s Wpn.HitStopTimer 1

# 属性に応じたパーティクル表示
    # 属性ダメージが0の場合、無属性として扱う
        execute if score #mhdp_temp_element_attack_value MhdpCore matches ..0 run scoreboard players set #mhdp_temp_damage_element_vfx_type MhdpCore 0
    # 無属性・斬撃
        execute if score #mhdp_temp_damage_phys_type MhdpCore matches 0 run particle block{block_state:"minecraft:red_wool"} ^ ^ ^ 0.1 0.1 0.1 0.5 15 normal
        execute if score #mhdp_temp_damage_phys_type MhdpCore matches 0 if score #mhdp_temp_defence_phys MhdpCore matches 45.. run particle dust_pillar{block_state:"minecraft:red_wool"} ^ ^ ^ 0.2 0.1 0.2 0.5 15 normal
    # 火
        execute if score #mhdp_temp_damage_element_vfx_type MhdpCore matches 1 run particle flame ~ ~ ~ 0.2 0.2 0.2 0.05 10
    # 水
        execute if score #mhdp_temp_damage_element_vfx_type MhdpCore matches 2 run particle rain ~ ~ ~ 0.2 0.2 0.2 0.15 20
    # 雷
        execute if score #mhdp_temp_damage_element_vfx_type MhdpCore matches 3 run particle electric_spark ~ ~ ~ 0.2 0.2 0.2 0.5 20
    # 氷
        execute if score #mhdp_temp_damage_element_vfx_type MhdpCore matches 4 run particle snowflake ~ ~ ~ 0.2 0.2 0.2 0.05 10 normal
    # 龍
        execute if score #mhdp_temp_damage_element_vfx_type MhdpCore matches 5 run particle dust_color_transition{from_color:[0.322,0.000,0.000],scale:1.5,to_color:[1.000,0.361,0.361]} ~ ~ ~ 0.3 0.3 0.3 0.15 10
    # 毒
        execute if score #mhdp_temp_condition_value_poison MhdpCore matches 1.. run particle dust{color:[0.502,0.016,0.710],scale:1.5} ~ ~ ~ 0.5 0.5 0.5 0.15 10
    # 麻痺
        execute if score #mhdp_temp_condition_value_paralysis MhdpCore matches 1.. run particle dust{color:[1.000,0.969,0.000],scale:1.5} ~ ~ ~ 0.5 0.5 0.5 0.15 10
    # 爆破
        execute if score #mhdp_temp_condition_value_bomb MhdpCore matches 1.. run particle dust{color:[0.220,0.820,0.000],scale:1.5} ~ ~ ~ 0.5 0.5 0.5 0.15 10

# ヒットエフェクト表示
    # X軸方向のずれを修正
        scoreboard players set #mhdp_temp_vfx_offset MhdpCore 4
        execute if data storage api: Arg.VfxScale store result score #mhdp_temp_vfx_offset MhdpCore run data get storage api: Arg.VfxScale[0]
    # Z軸回転取得
        data modify storage mhdp_core:temp Arg.VfxRotation set from storage api: Arg.VfxRotation
        execute if score #mhdp_temp_damage_phys_type MhdpCore matches 1 store result storage mhdp_core:temp Arg.VfxRotation int 1 run random value 0..360
    # 位置オフセット取得
        function api:damage_player_to_entity/vfx/calc_offset
    # 表示
        # 斬撃
            execute if score #mhdp_temp_damage_phys_type MhdpCore matches 0 if data storage api: Arg{IsShowVfx:true} positioned as @e[tag=Temp.Victim] facing entity @s feet run function api:damage_player_to_entity/vfx/summon_slash_effect.m with storage mhdp_core:temp Arg
        # 打撃
            execute if score #mhdp_temp_damage_phys_type MhdpCore matches 1 if data storage api: Arg{IsShowVfx:true} positioned as @e[tag=Temp.Victim] facing entity @s feet run function api:damage_player_to_entity/vfx/summon_blow_effect.m with storage mhdp_core:temp Arg
        # 射撃
            execute if score #mhdp_temp_damage_phys_type MhdpCore matches 2 if data storage api: Arg{IsShowVfx:true} run particle enchanted_hit ~ ~0.5 ~ 0 0 0 0.3 10

# ダメージ数値表示
    function api:damage_player_to_entity/vfx/show_damage

# 終了
    data remove storage mhdp_core:temp Arg
