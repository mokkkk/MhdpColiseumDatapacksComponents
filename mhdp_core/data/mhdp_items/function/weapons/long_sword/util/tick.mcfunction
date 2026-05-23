#> mhdp_items:weapons/long_sword/util/tick
#
# 武器のtick処理
#
# @within function mhdp_items:core/switch/macro/m.tick

# 練気色減少
    execute if score @s Wpn.Ls.SpiritLevelGauge matches 1.. run scoreboard players remove @s Wpn.Ls.SpiritLevelGauge 1
