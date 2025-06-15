#> mhdp_items:weapons/bow/type_normal/6_shot_pierce/attack
#
# 射撃 攻撃判定
#
# @within function mhdp_items:weapons/bow/type_normal/6_shot_pierce/main

# 召喚
    execute store result storage api: Arg.Override.PlyUid int 1 run scoreboard players get @s Ply.Uid
    data modify storage api: Arg.Override.ChargeCount set value 3
    data modify storage api: Arg.Override.IsTec set value false
    execute positioned ^ ^ ^ rotated ~ ~-0.5 run function api:object/summon.m {ObjectId:2}

# 演出
    execute positioned ^ ^ ^1 run function mhdp_items:weapons/bow/type_tec/6_shot_pierce/particle

# 終了
    tag @e[type=item_display,tag=Other.Shot,tag=Wpn.Bw.Shot.Pierce,tag=Start] remove Start
    scoreboard players reset #mhdp_temp_bow_charge_count MhdpCore
