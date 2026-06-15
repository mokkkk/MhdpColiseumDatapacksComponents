#> mhdp_items:weapons/long_sword/util/tick
#
# 武器のtick処理
#
# @within function mhdp_items:core/switch/macro/m.tick

# インターバル減少
    execute if score @s Wpn.Ls.SpiritInterval matches 1.. run scoreboard players remove @s Wpn.Ls.SpiritInterval 1

# 練気減少
    execute unless score @s Wpn.Ls.SpiritMaxTimer matches 1.. unless score @s Wpn.Ls.SpiritGaugeRegen matches 1.. unless score @s Wpn.Ls.SpiritInterval matches 1.. run scoreboard players add @s Wpn.Ls.SpiritReduction 1
    execute unless score @s Wpn.Ls.SpiritMaxTimer matches 1.. if score @s Wpn.Ls.SpiritGauge matches 1.. if score @s Wpn.Ls.SpiritReduction matches 2.. run scoreboard players remove @s Wpn.Ls.SpiritGauge 1
    execute unless score @s Wpn.Ls.SpiritMaxTimer matches 1.. if score @s Wpn.Ls.SpiritReduction matches 2.. run scoreboard players set @s Wpn.Ls.SpiritReduction 0

# 練気上昇
    execute if score @s Wpn.Ls.SpiritGaugeRegen matches 1.. run scoreboard players add @s Wpn.Ls.SpiritGauge 2
    execute if score @s Wpn.Ls.SpiritGaugeRegen matches 1.. run scoreboard players remove @s Wpn.Ls.SpiritGaugeRegen 2
    execute if score @s Wpn.Ls.SpiritGauge matches 1001.. run scoreboard players set @s Wpn.Ls.SpiritGauge 1000

# 練気色減少
    execute if entity @s[tag=Ply.Weapon.Type.Tech] if score @s Wpn.Ls.SpiritLevelGauge matches 601.. run scoreboard players set @s Wpn.Ls.SpiritLevelGauge 600
    execute if entity @s[tag=Ply.Weapon.Type.Tech] if score @s Wpn.Ls.SpiritLevel matches 1.. run scoreboard players add @s Wpn.Ls.SpiritLevelReduction 1
    execute if entity @s[tag=Ply.Weapon.Type.Tech] if score @s Wpn.Ls.SpiritLevel matches 1 if score @s Wpn.Ls.SpiritLevelReduction matches 4.. run return run function mhdp_items:weapons/long_sword/util/down_spirit_level
    execute if entity @s[tag=Ply.Weapon.Type.Tech] if score @s Wpn.Ls.SpiritLevel matches 2 if score @s Wpn.Ls.SpiritLevelReduction matches 3.. run return run function mhdp_items:weapons/long_sword/util/down_spirit_level
    execute if entity @s[tag=Ply.Weapon.Type.Tech] if score @s Wpn.Ls.SpiritLevel matches 3 if score @s Wpn.Ls.SpiritLevelReduction matches 2.. run return run function mhdp_items:weapons/long_sword/util/down_spirit_level
