#> mhdp_items:weapons/bow/type_normal/13_jump_shot/attack
#
# 射撃 攻撃判定
#
# @within function mhdp_items:weapons/bow/type_normal/13_jump_shot/main

# 矢を召喚
    execute store result storage api: Arg.Override.PlyUid int 1 run scoreboard players get @s Ply.Uid
    data modify storage api: Arg.Override.TargetUid set from storage mhdp_core:temp PlayerData.Bow.TargetUidList[0]
    data remove storage mhdp_core:temp PlayerData.Bow.TargetUidList[0]
    data modify storage api: Arg.Override.IsTec set value false
    execute rotated ~ ~ positioned ^ ^ ^ run function api:object/summon.m {ObjectId:6}
 
# 演出
    execute positioned ^ ^ ^1 run function mhdp_items:weapons/bow/type_normal/13_jump_shot/particle
