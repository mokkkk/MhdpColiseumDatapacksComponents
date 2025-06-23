#> mhdp_items:weapons/bow/type_tec/9_equip_bottle/equip
#
# ビン装填
#
# @within function mhdp_items:weapons/bow/type_tec/main

# ゲージが100以上ある場合、すべて消費してビンを最大まで装填
    execute if score @s Wpn.Bw.Gauge matches 100.. unless score @s Wpn.Bw.Bottle.Count matches 1.. run scoreboard players set @s Wpn.Bw.Bottle.Count 8
    execute if score @s Wpn.Bw.Gauge matches 100.. if score @s Wpn.Bw.Bottle.Count matches 8 run return run scoreboard players remove @s Wpn.Bw.Gauge 100

# ビン装填
    execute if score @s Wpn.Bw.Gauge matches 13.. if score @s Wpn.Bw.Bottle.Count matches ..7 run scoreboard players add @s Wpn.Bw.Bottle.Count 1
    scoreboard players remove @s Wpn.Bw.Gauge 13
    
# ゲージが残っており、ビン装填の余裕がある場合、繰り返す
    execute if score @s Wpn.Bw.Gauge matches 13.. if score @s Wpn.Bw.Bottle.Count matches ..7 run function mhdp_items:weapons/bow/type_tec/9_equip_bottle/equip
