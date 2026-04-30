#> mhdp_items:weapons/lance/util/tick
#
# 武器のtick処理
#
# @within function mhdp_items:core/switch/macro/m.tick

# ガードレイジゲージ減少
    execute if score @s Wpn.Lc.RageTimer matches 1.. run scoreboard players remove @s Wpn.Lc.RageTimer 1
    execute if score @s Wpn.Lc.RageTimer matches ..0 run scoreboard players reset @s Wpn.Lc.RageLevel
    execute if score @s Wpn.Lc.RageTimer matches ..0 run scoreboard players reset @s Wpn.Lc.RageTimer
