#> mhdp_monsters:core/util/other/walk_turn_to_center.m
# 
# 汎用処理 中心方向に向かって歩く
#
# @within function mhdp_monsters:/**

# 中心位置が近い場合、実行しない
    $execute if entity @n[type=marker,tag=Mk.Field.AreaCenter,tag=Mk.Field.Area$(AreaId),distance=..30] run return 0

# 中心位置に向かう
    summon marker ~ ~ ~ {Tags:["Temp.Rotate.Target.Marker"]}
    $execute facing entity @n[type=marker,tag=Mk.Field.AreaCenter,tag=Mk.Field.Area$(AreaId)] feet as @n[type=marker,tag=Temp.Rotate.Target.Marker] run tp @s ~ ~ ~ ~ 0
    execute store result score #temp_rotate_0 MhdpCore run data get entity @s Rotation[0] 1
    execute as @n[type=marker,tag=Temp.Rotate.Target.Marker] store result score #temp_rotate_1 MhdpCore run data get entity @s Rotation[0] 1
    scoreboard players operation #temp_rotate_1 MhdpCore -= #temp_rotate_0 MhdpCore
    execute store result score @s Mns.Temp.RotateValue run scoreboard players operation #temp_rotate_1 MhdpCore /= #const_2 Const

# 終了
    scoreboard players reset #temp_rotate_1 MhdpCore
    scoreboard players reset #temp_rotate_0 MhdpCore
    kill @e[type=marker,tag=Temp.Rotate.Target.Marker]
