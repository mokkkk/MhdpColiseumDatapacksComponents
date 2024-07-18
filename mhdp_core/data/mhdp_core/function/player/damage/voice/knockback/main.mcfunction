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
    execute if score #mhdp_temp_knockback_strength MhdpCore matches 2 run scoreboard players set $strength delta.api.launch 10000

# ノックバック適用
    execute if score #mhdp_temp_knockback_strength MhdpCore matches 1.. run tp @s @s
    execute if score #mhdp_temp_knockback_strength MhdpCore matches 1.. rotated ~ -30 positioned as @s run function delta:api/launch_looking
