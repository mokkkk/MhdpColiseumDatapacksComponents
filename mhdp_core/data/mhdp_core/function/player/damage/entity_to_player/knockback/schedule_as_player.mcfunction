#> mhdp_core:player/damage/entity_to_player/knockback/main
#
# モンスターからプレイヤーに対してのダメージ処理 ノックバック
#
# @within function mhdp_core:player/damage/entity_to_player/apply
# @input
#        storage mhdp_core:temp Damage.IsLaunch 打ち上げ有無
#        storage mhdp_core:temp Damage.LaunchType 打ち上げ方向、1:上、2：斜め上

# ノックバック適用
    execute if score #mhdp_temp_knockback_strength MhdpCore matches 1.. run tp @s @s
    execute if entity @s[tag=Ply.Weapon.Guard] if score #mhdp_temp_knockback_strength MhdpCore matches 1.. at @s run tp @s ~ ~0.1 ~
    execute if entity @s[tag=!Ply.Weapon.Guard] if score #mhdp_temp_knockback_strength MhdpCore matches 1.. if data storage mhdp_core:temp Damage{IsLaunch:false} facing entity @s feet rotated ~ -18 positioned as @s run function player_motion:api/launch_looking
    execute if entity @s[tag=!Ply.Weapon.Guard] if score #mhdp_temp_knockback_strength MhdpCore matches 1.. if data storage mhdp_core:temp Damage{IsLaunch:true,LaunchType:1} facing entity @s feet rotated ~ -60 positioned as @s run function player_motion:api/launch_looking
    execute if entity @s[tag=!Ply.Weapon.Guard] if score #mhdp_temp_knockback_strength MhdpCore matches 1.. if data storage mhdp_core:temp Damage{IsLaunch:true,LaunchType:2} facing entity @s feet rotated ~ -35 positioned as @s run function player_motion:api/launch_looking
    execute if entity @s[tag=Ply.Weapon.Guard] if score #mhdp_temp_knockback_strength MhdpCore matches 1.. facing entity @s feet rotated ~ -10 positioned as @s run function player_motion:api/launch_looking
