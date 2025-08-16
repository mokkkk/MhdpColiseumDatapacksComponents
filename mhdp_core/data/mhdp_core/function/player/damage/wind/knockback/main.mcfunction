#> mhdp_core:player/damage/wind/knockback/main
#
# モンスターからプレイヤーに対してのダメージ処理 風圧
#
# @within function mhdp_core:player/damage/wind/apply
# @input
#        storage mhdp_core:temp Damage.IsLaunch 打ち上げ有無

# アーマー計算
    execute if entity @s[tag=Ply.Weapon.Armor.Super] run scoreboard players remove #mhdp_temp_wind_value MhdpCore 1
    execute if entity @s[tag=Ply.Weapon.Armor.Hyper] run scoreboard players set #mhdp_temp_wind_value MhdpCore 0
    execute if entity @s[tag=Itm.Sp.ImmovableCloth.Using] run scoreboard players set #mhdp_temp_wind_value MhdpCore 0

# 発射威力取得
    execute if score #mhdp_temp_wind_value MhdpCore matches ..0 run scoreboard players set $strength player_motion.api.launch 0
    execute if score #mhdp_temp_wind_value MhdpCore matches 1 run scoreboard players set $strength player_motion.api.launch 8000
    execute if score #mhdp_temp_wind_value MhdpCore matches 2 run scoreboard players set $strength player_motion.api.launch 12000
    execute if score #mhdp_temp_wind_value MhdpCore matches 3.. run scoreboard players set $strength player_motion.api.launch 18000

# ノックバック適用
    execute if score #mhdp_temp_wind_value MhdpCore matches 1.. run tp @s @s
    execute if score #mhdp_temp_wind_value MhdpCore matches 1.. rotated ~ -10 positioned as @s run function player_motion:api/launch_looking
