#> mhdp_items:weapons/long_sword/util/tick
#
# 武器のtick処理
#
# @within function mhdp_items:core/switch/macro/m.tick

# 練気色減少
    execute if score @s Wpn.Ls.SpiritLevelGauge matches 601.. run scoreboard players set @s Wpn.Ls.SpiritLevelGauge 600
    execute if score @s Wpn.Ls.SpiritLevel matches 1.. run scoreboard players add @s Wpn.Ls.SpiritLevelReduction 1
    execute if score @s Wpn.Ls.SpiritLevel matches 1 if score @s Wpn.Ls.SpiritLevelReduction matches 4.. run return run function mhdp_items:weapons/long_sword/util/down_spirit_level
    execute if score @s Wpn.Ls.SpiritLevel matches 2 if score @s Wpn.Ls.SpiritLevelReduction matches 3.. run return run function mhdp_items:weapons/long_sword/util/down_spirit_level
    execute if score @s Wpn.Ls.SpiritLevel matches 3 if score @s Wpn.Ls.SpiritLevelReduction matches 2.. run return run function mhdp_items:weapons/long_sword/util/down_spirit_level
