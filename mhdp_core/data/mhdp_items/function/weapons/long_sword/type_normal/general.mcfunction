#> mhdp_items:weapons/long_sword/type_normal/general
#
# 共通処理
#
# @within function mhdp_items:weapons/long_sword/type_normal/main

# 練気マックス補正終了
    execute if score @s Wpn.Ls.SpiritMaxTimer matches 1 if score @s Wpn.Ls.SpiritGauge matches 1000.. run scoreboard players set @s Wpn.Ls.SpiritGauge 999
    execute if score @s Wpn.Ls.SpiritMaxTimer matches 1.. run scoreboard players remove @s Wpn.Ls.SpiritMaxTimer 1

# 練気マックス補正開始
    execute if score @s Wpn.Ls.SpiritMaxTimer matches ..0 if score @s Wpn.Ls.SpiritGauge matches 1000.. run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 2
    execute if score @s Wpn.Ls.SpiritMaxTimer matches ..0 if score @s Wpn.Ls.SpiritGauge matches 1000.. run scoreboard players set @s Wpn.Ls.SpiritMaxTimer 600
