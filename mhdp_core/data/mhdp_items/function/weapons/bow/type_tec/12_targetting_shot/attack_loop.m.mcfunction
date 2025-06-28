#> mhdp_items:weapons/bow/type_tec/12_targetting_shot/attack_loop.m
#
# 射撃 攻撃判定
#
# @within function mhdp_items:weapons/bow/type_tec/12_targetting_shot/main

# 矢を召喚
    execute store result storage api: Arg.Override.PlyUid int 1 run scoreboard players get @s Ply.Uid
    data modify storage api: Arg.Override.TargetUid set from storage mhdp_core:temp PlayerData.Bow.TargetUidList[0]
    data remove storage mhdp_core:temp PlayerData.Bow.TargetUidList[0]
    data modify storage api: Arg.Override.IsTec set value true
    function mhdp_items:weapons/bow/shot/apply_bottle_effect
    $execute rotated ~$(StartRotation) ~-30 positioned ^ ^ ^ run function api:object/summon.m {ObjectId:5}

# ターゲットビンが残っている場合、繰り返す
    scoreboard players remove @s Wpn.Bw.Bottle.Targetting 1
    $execute if score @s Wpn.Bw.Bottle.Targetting matches 1.. rotated ~20 ~ run function mhdp_items:weapons/bow/type_tec/12_targetting_shot/attack_loop.m {StartRotation:$(StartRotation)}
