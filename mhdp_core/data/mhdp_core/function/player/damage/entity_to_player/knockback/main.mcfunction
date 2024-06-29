#> mhdp_core:player/damage/entity_to_player/knockback/main
#
# モンスターからプレイヤーに対してのダメージ処理 ノックバック
#
# @within function mhdp_core:player/damage/entity_to_player/apply
# @input
#        storage mhdp_core:temp Damage.Knockback ノックバックタイプ
#        storage mhdp_core:temp Damage.IsLaunch 打ち上げ有無

# ノックバックの大きさ取得
    execute store result score #mhdp_temp_knockback_strength MhdpCore run data get storage mhdp_core:temp Damage.Knockback

# アーマー計算


# 発射威力取得
    execute if score #mhdp_temp_knockback_strength MhdpCore matches ..0 run scoreboard players set $strength delta.api.launch 0
    execute if score #mhdp_temp_knockback_strength MhdpCore matches 1 run scoreboard players set $strength delta.api.launch 8000
    execute if score #mhdp_temp_knockback_strength MhdpCore matches 2 run scoreboard players set $strength delta.api.launch 12000
    execute if score #mhdp_temp_knockback_strength MhdpCore matches 3.. run scoreboard players set $strength delta.api.launch 22000

# ノックバック適用
    execute if score #mhdp_temp_knockback_strength MhdpCore matches 1.. run tp @s @s
    execute if score #mhdp_temp_knockback_strength MhdpCore matches 1.. if data storage mhdp_core:temp Damage{IsLaunch:false} facing entity @s feet rotated ~ -18 positioned as @s run function delta:api/launch_looking
    execute if score #mhdp_temp_knockback_strength MhdpCore matches 1.. if data storage mhdp_core:temp Damage{IsLaunch:true} facing entity @s feet rotated ~ -60 positioned as @s run function delta:api/launch_looking

# 武器操作中断
    # 操作無効化
        execute if score #mhdp_temp_knockback_strength MhdpCore matches 1.. run scoreboard players set @s Wpn.DeactivateTimer 20
    # 操作中断
        execute if score #mhdp_temp_knockback_strength MhdpCore matches 1.. run execute if entity @s[tag=Ply.State.UsingWeapon] run function mhdp_items:core/switch/weapon_interrupt
