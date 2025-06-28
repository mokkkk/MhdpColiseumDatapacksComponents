#> mhdp_items:weapons/bow/type_tec/12_targetting_shot/target
#
# 昇天煌弓・箭射 ロックオン
#
# @within function mhdp_items:weapons/bow/type_tec/12_targetting_shot/main

# ビンが足りない場合、スキップ
    execute if score @s Wpn.Bw.Bottle.Count <= @s Wpn.Bw.Bottle.Targetting run return run scoreboard players set @s Wpn.AnimationTimer 0

# 対象決定
    execute anchored eyes positioned ^ ^ ^5 positioned ~-5 ~-5 ~-5 run tag @e[type=slime,tag=Mns.HitBox,dx=10,dy=10,dz=10] add Temp.Hit
    execute anchored eyes positioned ^ ^ ^15 positioned ~-5 ~-5 ~-5 run tag @e[type=slime,tag=Mns.HitBox,dx=10,dy=10,dz=10] add Temp.Hit
    execute anchored eyes positioned ^ ^ ^25 positioned ~-5 ~-5 ~-5 run tag @e[type=slime,tag=Mns.HitBox,dx=10,dy=10,dz=10] add Temp.Hit
    # 対象が居ない場合、スキップ
        execute unless entity @n[tag=Temp.Hit] run return run scoreboard players set @s Wpn.AnimationTimer 0

# 対象を保持
    execute store result storage mhdp_core:temp Temp.TargetUid int 1 run scoreboard players get @n[tag=Temp.Hit] Entity.Uuid
    data modify storage mhdp_core:temp PlayerData.Bow.TargetUidList append from storage mhdp_core:temp Temp.TargetUid
    function mhdp_core:player/data/save_data

# ロックオンビンに変更
    scoreboard players add @s Wpn.Bw.Bottle.Targetting 1
    playsound block.iron_door.close master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.6

# 終了
    tag @e[type=slime,tag=Temp.Hit] remove Temp.Hit
    scoreboard players set @s Wpn.AnimationTimer 0
