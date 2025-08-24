#> mhdp_items:weapons/bow/type_normal/12_targetting_shot/attack_loop.m
#
# 射撃 攻撃判定
#
# @within function mhdp_items:weapons/bow/type_normal/12_targetting_shot/main

# 対象決定
    execute anchored eyes positioned ^ ^ ^2 positioned ~-2 ~-2 ~-2 run tag @e[type=slime,tag=Mns.HitBox,dx=4,dy=4,dz=4] add Temp.Hit
    execute anchored eyes positioned ^ ^ ^6 positioned ~-2 ~-2 ~-2 run tag @e[type=slime,tag=Mns.HitBox,dx=4,dy=4,dz=4] add Temp.Hit
    execute anchored eyes positioned ^ ^ ^10 positioned ~-2 ~-2 ~-2 run tag @e[type=slime,tag=Mns.HitBox,dx=4,dy=4,dz=4] add Temp.Hit
    execute anchored eyes positioned ^ ^ ^14 positioned ~-2 ~-2 ~-2 run tag @e[type=slime,tag=Mns.HitBox,dx=4,dy=4,dz=4] add Temp.Hit
    execute anchored eyes positioned ^ ^ ^18 positioned ~-2 ~-2 ~-2 run tag @e[type=slime,tag=Mns.HitBox,dx=4,dy=4,dz=4] add Temp.Hit
    execute anchored eyes positioned ^ ^ ^22 positioned ~-2 ~-2 ~-2 run tag @e[type=slime,tag=Mns.HitBox,dx=4,dy=4,dz=4] add Temp.Hit
    execute anchored eyes positioned ^ ^ ^26 positioned ~-2 ~-2 ~-2 run tag @e[type=slime,tag=Mns.HitBox,dx=4,dy=4,dz=4] add Temp.Hit
    execute anchored eyes positioned ^ ^ ^30 positioned ~-2 ~-2 ~-2 run tag @e[type=slime,tag=Mns.HitBox,dx=4,dy=4,dz=4] add Temp.Hit

# 矢を召喚
    execute store result storage api: Arg.Override.PlyUid int 1 run scoreboard players get @s Ply.Uid
    execute store result storage api: Arg.Override.TargetUid int 1 run scoreboard players get @n[tag=Temp.Hit] Entity.Uuid
    data modify storage api: Arg.Override.IsTec set value false
    function mhdp_items:weapons/bow/shot/apply_bottle_effect
    $execute rotated ~$(StartRotation) ~-30 positioned ^ ^ ^ run function api:object/summon.m {ObjectId:5}

# ターゲットビンが残っている場合、繰り返す
    scoreboard players remove @s Wpn.Bw.Bottle.Targetting 1
    $execute if score @s Wpn.Bw.Bottle.Targetting matches 1.. rotated ~20 ~ run function mhdp_items:weapons/bow/type_normal/12_targetting_shot/attack_loop.m {StartRotation:$(StartRotation)}

# 終了
    tag @e[tag=Temp.Hit] remove Temp.Hit
