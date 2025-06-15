#> mhdp_items:weapons/bow/shot/normal/summon_2
#
# 矢の召喚処理
#
# @within function mhdp_items:/**

# 召喚
    execute store result storage api: Arg.Override.PlyUid int 1 run scoreboard players get @s Ply.Uid
    data modify storage api: Arg.Override.ChargeCount set value 3
    data modify storage api: Arg.Override.IsTec set value false
    data modify storage api: Arg.Override.IsFlyingShot set value false
    data modify storage api: Arg.Override.Speed set value "A"
    execute positioned ^ ^ ^ rotated ~ ~-0.5 run function api:object/summon.m {ObjectId:1}
# 召喚
    execute store result storage api: Arg.Override.PlyUid int 1 run scoreboard players get @s Ply.Uid
    data modify storage api: Arg.Override.ChargeCount set value 3
    data modify storage api: Arg.Override.IsTec set value false
    data modify storage api: Arg.Override.IsFlyingShot set value false
    data modify storage api: Arg.Override.Speed set value "B"
    execute positioned ^0.06 ^0.1 ^ rotated ~-0.3 ~-0.55 run function api:object/summon.m {ObjectId:1}
# 召喚
    execute store result storage api: Arg.Override.PlyUid int 1 run scoreboard players get @s Ply.Uid
    data modify storage api: Arg.Override.ChargeCount set value 3
    data modify storage api: Arg.Override.IsTec set value false
    data modify storage api: Arg.Override.IsFlyingShot set value false
    data modify storage api: Arg.Override.Speed set value "C"
    execute positioned ^-0.05 ^0.15 ^ rotated ~0.2 ~-0.6 run function api:object/summon.m {ObjectId:1}
# 召喚
    execute store result storage api: Arg.Override.PlyUid int 1 run scoreboard players get @s Ply.Uid
    data modify storage api: Arg.Override.ChargeCount set value 3
    data modify storage api: Arg.Override.IsTec set value false
    data modify storage api: Arg.Override.IsFlyingShot set value false
    data modify storage api: Arg.Override.Speed set value "D"
    execute positioned ^ ^0.25 ^-0.4 rotated ~0.2 ~-0.7 run function api:object/summon.m {ObjectId:1}
