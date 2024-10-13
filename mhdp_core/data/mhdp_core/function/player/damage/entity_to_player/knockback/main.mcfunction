#> mhdp_core:player/damage/entity_to_player/knockback/main
#
# モンスターからプレイヤーに対してのダメージ処理 ノックバック
#
# @within function mhdp_core:player/damage/entity_to_player/apply
# @input
#        storage mhdp_core:temp Damage.IsLaunch 打ち上げ有無
#        storage mhdp_core:temp Damage.LaunchType 打ち上げ方向、1:上、2：斜め上

# アーマー計算
    execute if entity @s[tag=Ply.Weapon.Armod.Super] run scoreboard players remove #mhdp_temp_knockback_strength MhdpCore 1
    execute if entity @s[tag=Ply.Weapon.Armod.Hyper] run scoreboard players set #mhdp_temp_knockback_strength MhdpCore 0
    execute if entity @s[tag=Itm.Sp.ImmovableCloth.Using] run scoreboard players set #mhdp_temp_knockback_strength MhdpCore 0
    # ハイパーアーマー時、ダメージを軽減
        execute if entity @s[tag=Ply.Weapon.Armod.Hyper] if score #mhdp_temp_damage_reduction MhdpCore matches 100.. run scoreboard players set #mhdp_temp_damage_reduction MhdpCore 50
        execute if entity @s[tag=Itm.Sp.ImmovableCloth.Using] if score #mhdp_temp_damage_reduction MhdpCore matches 100.. run scoreboard players set #mhdp_temp_damage_reduction MhdpCore 50

# 発射威力取得
    execute if score #mhdp_temp_knockback_strength MhdpCore matches ..0 run scoreboard players set $strength delta.api.launch 0
    execute if score #mhdp_temp_knockback_strength MhdpCore matches 1 run scoreboard players set $strength delta.api.launch 8000
    execute if score #mhdp_temp_knockback_strength MhdpCore matches 2 run scoreboard players set $strength delta.api.launch 12000
    execute if score #mhdp_temp_knockback_strength MhdpCore matches 3.. run scoreboard players set $strength delta.api.launch 24000

# ノックバック適用
    execute if score #mhdp_temp_knockback_strength MhdpCore matches 1.. run tp @s @s
    execute if entity @s[tag=Ply.Weapon.Guard] if score #mhdp_temp_knockback_strength MhdpCore matches 1.. at @s run tp @s ~ ~0.1 ~
    execute if entity @s[tag=!Ply.Weapon.Guard] if score #mhdp_temp_knockback_strength MhdpCore matches 1.. if data storage mhdp_core:temp Damage{IsLaunch:false} facing entity @s feet rotated ~ -18 positioned as @s run function delta:api/launch_looking
    execute if entity @s[tag=!Ply.Weapon.Guard] if score #mhdp_temp_knockback_strength MhdpCore matches 1.. if data storage mhdp_core:temp Damage{IsLaunch:true,LaunchType:1} facing entity @s feet rotated ~ -60 positioned as @s run function delta:api/launch_looking
    execute if entity @s[tag=!Ply.Weapon.Guard] if score #mhdp_temp_knockback_strength MhdpCore matches 1.. if data storage mhdp_core:temp Damage{IsLaunch:true,LaunchType:2} facing entity @s feet rotated ~ -35 positioned as @s run function delta:api/launch_looking
    execute if entity @s[tag=Ply.Weapon.Guard] if score #mhdp_temp_knockback_strength MhdpCore matches 1.. facing entity @s feet rotated ~ -10 positioned as @s run function delta:api/launch_looking

# 武器操作中断
    # 操作無効化
        execute if entity @s[tag=!Ply.Weapon.Guard] if score #mhdp_temp_knockback_strength MhdpCore matches 1.. run scoreboard players set @s Wpn.DeactivateTimer 20
    # 操作中断
        execute if entity @s[tag=Ply.State.UsingWeapon,tag=!Ply.Weapon.Guard] if score #mhdp_temp_knockback_strength MhdpCore matches 1.. run function mhdp_items:core/switch/weapon_interrupt
