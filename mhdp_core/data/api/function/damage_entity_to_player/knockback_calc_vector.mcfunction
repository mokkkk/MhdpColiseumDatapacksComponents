#> api:damage_entity_to_player/knockback_calc_vector
#
# モンスターからプレイヤーに対してのダメージ処理 ノックバック保存
#
# @within function mhdp_core:player/damage/entity_to_player/apply

# プレイヤーデータ読み込み
    function mhdp_core:player/data/load_data

# ノックバック実行フラグ付与
    execute if score #mhdp_temp_knockback_strength MhdpCore matches 1.. run tag @s add Ply.Temp.DoKnockback

# ノックバック距離
    execute if score #mhdp_temp_knockback_strength MhdpCore matches ..0 store result storage mhdp_core:temp PlayerData.KnockbackStrength int 1 run scoreboard players set $strength player_motion.api.launch 0
    execute if score #mhdp_temp_knockback_strength MhdpCore matches 1 store result storage mhdp_core:temp PlayerData.KnockbackStrength int 1 run scoreboard players set $strength player_motion.api.launch 8000
    execute if score #mhdp_temp_knockback_strength MhdpCore matches 2 store result storage mhdp_core:temp PlayerData.KnockbackStrength int 1 run scoreboard players set $strength player_motion.api.launch 12000
    execute if score #mhdp_temp_knockback_strength MhdpCore matches 3.. store result storage mhdp_core:temp PlayerData.KnockbackStrength int 1 run scoreboard players set $strength player_motion.api.launch 24000
    # ガード成功時
        execute if entity @s[tag=Ply.Weapon.Guard] if score #mhdp_temp_guard_value MhdpCore matches ..2 if score #mhdp_temp_knockback_strength MhdpCore matches 1.. run scoreboard players set $strength player_motion.api.launch 8000
        execute if entity @s[tag=Ply.Weapon.Guard] if score #mhdp_temp_guard_value MhdpCore matches 3..4 if score #mhdp_temp_knockback_strength MhdpCore matches 2.. run scoreboard players set $strength player_motion.api.launch 12000

# 角度
    execute at @s run summon area_effect_cloud ~ ~ ~ {Tags:["Other.Temp.KnockbackVector"]}
    # 非ガード時
        execute if entity @s[tag=!Ply.Weapon.Guard] if data storage mhdp_core:temp Arg{IsLaunch:false} facing entity @s feet rotated ~ -25 positioned as @s run tp @n[type=area_effect_cloud,tag=Other.Temp.KnockbackVector,distance=..10,sort=nearest,limit=1] ~ ~ ~ ~ ~
    # 非ガード時、打ち上げあり
        execute if entity @s[tag=!Ply.Weapon.Guard] if data storage mhdp_core:temp Arg{IsLaunch:true} run function api:damage_entity_to_player/knockback_calc_vector_launch.m with storage mhdp_core:temp Arg
    # ガード成功時
        execute if entity @s[tag=Ply.Weapon.Guard] facing entity @s feet rotated ~ -10 positioned as @s run tp @n[type=area_effect_cloud,tag=Other.Temp.KnockbackVector,distance=..10,sort=nearest,limit=1] ~ ~ ~ ~ ~
    data modify storage mhdp_core:temp PlayerData.KnockbackVector set from entity @n[type=area_effect_cloud,tag=Other.Temp.KnockbackVector,distance=..10,sort=nearest,limit=1] Rotation
    kill @n[type=area_effect_cloud,tag=Other.Temp.KnockbackVector,distance=..10,sort=nearest,limit=1]

# プレイヤーデータ保存
    function mhdp_core:player/data/save_data
