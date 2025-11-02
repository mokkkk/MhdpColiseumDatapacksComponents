#> api:damage_entity_to_player/knockback
#
# モンスターからプレイヤーに対してのダメージ処理 ガード
#
# @within function mhdp_core:player/damage/entity_to_player/apply

# アーマー計算
    execute if entity @s[tag=Ply.Weapon.Armor.Super] run scoreboard players remove #mhdp_temp_knockback_strength MhdpCore 1
    execute if entity @s[tag=Ply.Weapon.Armor.Hyper] run scoreboard players set #mhdp_temp_knockback_strength MhdpCore 0
    execute if entity @s[tag=Itm.Sp.ImmovableCloth.Using] run scoreboard players set #mhdp_temp_knockback_strength MhdpCore 0

# 保持
    function mhdp_core:player/data/load_data
    execute if score #mhdp_temp_knockback_strength MhdpCore matches 1.. run tag @s add Ply.Temp.DoKnockback
    # 強さ
        execute if score #mhdp_temp_knockback_strength MhdpCore matches ..0 store result storage mhdp_core:temp PlayerData.KnockbackStrength int 1 run scoreboard players set $strength player_motion.api.launch 0
        execute if score #mhdp_temp_knockback_strength MhdpCore matches 1 store result storage mhdp_core:temp PlayerData.KnockbackStrength int 1 run scoreboard players set $strength player_motion.api.launch 8000
        execute if score #mhdp_temp_knockback_strength MhdpCore matches 2 store result storage mhdp_core:temp PlayerData.KnockbackStrength int 1 run scoreboard players set $strength player_motion.api.launch 12000
        execute if score #mhdp_temp_knockback_strength MhdpCore matches 3.. store result storage mhdp_core:temp PlayerData.KnockbackStrength int 1 run scoreboard players set $strength player_motion.api.launch 24000
        # ガード成功時
            execute if entity @s[tag=Ply.Weapon.Guard] if score #mhdp_temp_guard_value MhdpCore matches ..2 if score #mhdp_temp_knockback_strength MhdpCore matches 1.. run scoreboard players set $strength player_motion.api.launch 8000
            execute if entity @s[tag=Ply.Weapon.Guard] if score #mhdp_temp_guard_value MhdpCore matches 3..4 if score #mhdp_temp_knockback_strength MhdpCore matches 2.. run scoreboard players set $strength player_motion.api.launch 12000
    # 角度
        execute at @s run summon area_effect_cloud ~ ~ ~ {Tags:["Other.Temp.KnockbackVector"]}
        execute if entity @s[tag=!Ply.Weapon.Guard] if data storage mhdp_core:temp Arg{IsLaunch:false} facing entity @s feet rotated ~ -25 positioned as @s run tp @n[type=area_effect_cloud,tag=Other.Temp.KnockbackVector,distance=..10,sort=nearest,limit=1] ~ ~ ~ ~ ~
        execute if entity @s[tag=!Ply.Weapon.Guard] if data storage mhdp_core:temp Arg{IsLaunch:true,LaunchType:1} facing entity @s feet rotated ~ -60 positioned as @s run tp @n[type=area_effect_cloud,tag=Other.Temp.KnockbackVector,distance=..10,sort=nearest,limit=1] ~ ~ ~ ~ ~
        execute if entity @s[tag=!Ply.Weapon.Guard] if data storage mhdp_core:temp Arg{IsLaunch:true,LaunchType:2} facing entity @s feet rotated ~ -35 positioned as @s run tp @n[type=area_effect_cloud,tag=Other.Temp.KnockbackVector,distance=..10,sort=nearest,limit=1] ~ ~ ~ ~ ~
        execute if entity @s[tag=Ply.Weapon.Guard] facing entity @s feet rotated ~ -10 positioned as @s run tp @n[type=area_effect_cloud,tag=Other.Temp.KnockbackVector,distance=..10,sort=nearest,limit=1] ~ ~ ~ ~ ~
        data modify storage mhdp_core:temp PlayerData.KnockbackVector set from entity @n[type=area_effect_cloud,tag=Other.Temp.KnockbackVector,distance=..10,sort=nearest,limit=1] Rotation
        kill @n[type=area_effect_cloud,tag=Other.Temp.KnockbackVector,distance=..10,sort=nearest,limit=1]
    function mhdp_core:player/data/save_data

# 武器操作中断
    # 操作無効化
        execute if entity @s[tag=!Ply.Weapon.Guard] if score #mhdp_temp_knockback_strength MhdpCore matches 1.. run scoreboard players set @s Wpn.DeactivateTimer 20
    # 操作中断
        execute if entity @s[tag=Ply.State.UsingWeapon,tag=!Ply.Weapon.Guard] if score #mhdp_temp_knockback_strength MhdpCore matches 1.. run function mhdp_items:core/switch/weapon_interrupt
        execute if entity @s[tag=Ply.State.UsingWeapon,tag=!Ply.Weapon.Guard] if score #mhdp_temp_knockback_strength MhdpCore matches 1.. run function mhdp_items:core/switch/item/interrupt
