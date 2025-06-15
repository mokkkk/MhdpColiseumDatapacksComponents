#> mhdp_items:weapons/bow/type_normal/7_shot_shower/attack
#
# 射撃 攻撃判定
#
# @within function mhdp_items:weapons/bow/type_normal/7_shot_shower/main


# 召喚
    execute store result storage api: Arg.Override.PlyUid int 1 run scoreboard players get @s Ply.Uid
    execute positioned ^ ^ ^ rotated ~ ~-0.5 run function api:object/summon.m {ObjectId:3}
    execute store result storage api: Arg.Override.PlyUid int 1 run scoreboard players get @s Ply.Uid
    execute positioned ^0.5 ^ ^0.5 rotated ~-1.3 ~-0.55 run function api:object/summon.m {ObjectId:3}
    execute store result storage api: Arg.Override.PlyUid int 1 run scoreboard players get @s Ply.Uid
    execute positioned ^-0.5 ^0.15 ^ rotated ~1.2 ~-0.6 run function api:object/summon.m {ObjectId:3}
    execute store result storage api: Arg.Override.PlyUid int 1 run scoreboard players get @s Ply.Uid
    execute positioned ^ ^0.5 ^-0.4 rotated ~0.2 ~-2.7 run function api:object/summon.m {ObjectId:3}

# 演出
    execute positioned ^ ^ ^1 run function mhdp_items:weapons/bow/type_normal/7_shot_shower/particle

# 終了
    tag @e[type=item_display,tag=Other.Shot,tag=Wpn.Bw.Shot.Pierce,tag=Start] remove Start
    scoreboard players reset #mhdp_temp_bow_charge_count MhdpCore
