#> mhdp_items:weapons/bow/shot/normal/summon_0
#
# 矢の召喚処理
#
# @within function mhdp_items:/**

# 召喚
    # summon item_display ^ ^ ^ {teleport_duration:0,Tags:["Other.Shot","Wpn.Bw.Shot.Normal","Wpn.Bw.Type.Normal","Start"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.2f,1.2f,1.2f]},item:{id:"minecraft:paper",count:1,components:{"minecraft:item_model":"shot/player/arrow"}}}
    # tp @n[type=item_display,tag=Other.Shot,tag=Wpn.Bw.Shot.Normal] ~ ~ ~ ~ ~-0.5

# 召喚
    execute store result storage api: Arg.Override.PlyUid int 1 run scoreboard players get @s Ply.Uid
    data modify storage api: Arg.Override.ChargeCount set value 0
    data modify storage api: Arg.Override.IsTec set value false
    data modify storage api: Arg.Override.IsFlyingShot set value false
    data modify storage api: Arg.Override.Speed set value "A"
    execute positioned ^ ^ ^ rotated ~ ~-0.5 run function api:object/summon.m {ObjectId:1}
