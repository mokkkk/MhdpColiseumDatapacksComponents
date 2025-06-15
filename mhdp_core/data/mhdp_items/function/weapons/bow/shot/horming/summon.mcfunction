#> mhdp_items:weapons/bow/shot/horming/summon
#
# 矢の召喚処理
#
# @within function mhdp_items:/**

# 召喚
    execute store result storage api: Arg.Override.PlyUid int 1 run scoreboard players get @s Ply.Uid
    execute positioned ^ ^ ^ rotated ~ ~-0.5 run function api:object/summon.m {ObjectId:4}
