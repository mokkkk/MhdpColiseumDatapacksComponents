#> mhdp_core:player/damage/voice/knockback/main
#
# モンスターからプレイヤーに対してのダメージ処理 ノックバック
#
# @within function mhdp_core:player/damage/voice/apply
# @input
#        storage mhdp_core:temp Damage.IsLaunch 打ち上げ有無

# アーマー計算
    execute if entity @s[tag=Ply.Weapon.Armod.Super] run scoreboard players remove #mhdp_temp_knockback_strength MhdpCore 1
    execute if entity @s[tag=Ply.Weapon.Armod.Hyper] run scoreboard players set #mhdp_temp_knockback_strength MhdpCore 0

# 発射威力取得
    execute if score #mhdp_temp_knockback_strength MhdpCore matches ..0 run scoreboard players set $strength delta.api.launch 0
    execute if score #mhdp_temp_knockback_strength MhdpCore matches 1 run scoreboard players set $strength delta.api.launch 8000
    execute if score #mhdp_temp_knockback_strength MhdpCore matches 2 run scoreboard players set $strength delta.api.launch 12000
    execute if score #mhdp_temp_knockback_strength MhdpCore matches 3.. run scoreboard players set $strength delta.api.launch 22000

# ノックバック適用
    execute if score #mhdp_temp_knockback_strength MhdpCore matches 1.. run tp @s @s
    execute if score #mhdp_temp_knockback_strength MhdpCore matches 1.. if data storage mhdp_core:temp Damage{IsLaunch:false} facing entity @s feet rotated ~ -18 positioned as @s run function delta:api/launch_looking
    execute if score #mhdp_temp_knockback_strength MhdpCore matches 1.. if data storage mhdp_core:temp Damage{IsLaunch:true} facing entity @s feet rotated ~ -60 positioned as @s run function delta:api/launch_looking
