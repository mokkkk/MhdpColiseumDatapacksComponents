#> mhdp_items:weapons/long_sword/util/down_spirit_level
#
# 武器のtick処理
#
# @within function mhdp_items:core/switch/macro/m.tick

# 練気色ゲージ減少
    scoreboard players remove @s Wpn.Ls.SpiritLevelGauge 1
    scoreboard players set @s Wpn.Ls.SpiritLevelReduction 0

# 練気色減少
    execute if score @s Wpn.Ls.SpiritLevel matches 1.. if score @s Wpn.Ls.SpiritLevelGauge matches ..0 run scoreboard players remove @s Wpn.Ls.SpiritLevel 1
    execute if score @s Wpn.Ls.SpiritLevel matches 1.. if score @s Wpn.Ls.SpiritLevelGauge matches ..0 run scoreboard players set @s Wpn.Ls.SpiritLevelGauge 600
