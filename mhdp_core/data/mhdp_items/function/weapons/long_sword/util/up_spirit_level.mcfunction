#> mhdp_items:weapons/long_sword/util/up_spirit_level
#
# 武器のtick処理
#
# @within function mhdp_items:core/switch/macro/m.tick

# 練気色ゲージ上昇
    execute if score @s Wpn.Ls.SpiritLevel matches ..1 run scoreboard players set @s Wpn.Ls.SpiritLevelGauge 600

# 練気色上昇
    execute if score @s Wpn.Ls.SpiritLevel matches ..0 run return run scoreboard players set @s Wpn.Ls.SpiritLevel 1
    execute if score @s Wpn.Ls.SpiritLevel matches 1 run return run scoreboard players set @s Wpn.Ls.SpiritLevel 2
    execute if score @s Wpn.Ls.SpiritLevel matches 2 run return run scoreboard players set @s Wpn.Ls.SpiritLevel 3
