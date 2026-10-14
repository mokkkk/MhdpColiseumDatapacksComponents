#> mhdp_items:weapons/bow/type_tec/13_jump_shot/attack
#
# 射撃 攻撃判定
#
# @within function mhdp_items:weapons/bow/type_tec/13_jump_shot/main

# 矢を召喚
    execute store result storage api: Arg.Override.PlyUid int 1 run scoreboard players get @s Ply.Uid
    data modify storage api: Arg.Override.TargetUid set from storage mhdp_core:temp PlayerData.Bow.TargetUidList[0]
    data remove storage mhdp_core:temp PlayerData.Bow.TargetUidList[0]
    data modify storage api: Arg.Override.IsTec set value true
    function mhdp_items:weapons/bow/shot/apply_bottle_effect
    execute rotated ~ ~ positioned ^ ^ ^ run function api:object/summon.m {ObjectId:6}
 
# カメラ演出
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] run data modify storage api: Arg.Override.Type set value "medium"
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] run function api:effect/apply.m {EffectId:3}
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] run data modify storage api: Arg.Override.Type set value "blur"
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] run function api:effect/apply.m {EffectId:4}

# 演出
    execute positioned ^ ^ ^1 run function mhdp_items:weapons/bow/type_tec/13_jump_shot/particle
