#> mhdp_items:weapons/bow/shot/normal/summon_2
#
# 矢の召喚処理
#
# @within function mhdp_items:/**

# 召喚
    execute store result storage api: Arg.Override.PlyUid int 1 run scoreboard players get @s Ply.Uid
    execute store result storage api: Arg.Override.ChargeCount int 1 run scoreboard players get @s Wpn.Bw.ChargeCount
    data modify storage api: Arg.Override.IsTec set value true
    data modify storage api: Arg.Override.IsFlyingShot set value false
    data modify storage api: Arg.Override.Speed set value "A"
    execute if score @s Wpn.Bw.Bottle.Count matches 1.. run function mhdp_items:weapons/bow/shot/apply_bottle_effect
    execute positioned ^ ^ ^ rotated ~ ~-0.5 run function api:object/summon.m {ObjectId:1}
    execute store result storage api: Arg.Override.PlyUid int 1 run scoreboard players get @s Ply.Uid
    execute store result storage api: Arg.Override.ChargeCount int 1 run scoreboard players get @s Wpn.Bw.ChargeCount
    data modify storage api: Arg.Override.IsTec set value true
    data modify storage api: Arg.Override.IsFlyingShot set value false
    data modify storage api: Arg.Override.Speed set value "B"
    execute if score @s Wpn.Bw.Bottle.Count matches 1.. run function mhdp_items:weapons/bow/shot/apply_bottle_effect
    execute positioned ^0.15 ^ ^ rotated ~-3 ~-0.5 run function api:object/summon.m {ObjectId:1}
    execute store result storage api: Arg.Override.PlyUid int 1 run scoreboard players get @s Ply.Uid
    execute store result storage api: Arg.Override.ChargeCount int 1 run scoreboard players get @s Wpn.Bw.ChargeCount
    data modify storage api: Arg.Override.IsTec set value true
    data modify storage api: Arg.Override.IsFlyingShot set value false
    data modify storage api: Arg.Override.Speed set value "C"
    execute if score @s Wpn.Bw.Bottle.Count matches 1.. run function mhdp_items:weapons/bow/shot/apply_bottle_effect
    execute positioned ^-0.15 ^ ^ rotated ~3 ~-0.5 run function api:object/summon.m {ObjectId:1}

# 終了
    execute if score @s Wpn.Bw.Bottle.Count matches 1.. run scoreboard players remove @s Wpn.Bw.Bottle.Count 1
