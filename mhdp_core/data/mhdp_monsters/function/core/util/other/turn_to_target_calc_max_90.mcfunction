#> mhdp_monsters:core/util/other/turn_to_target_calc_max_90
# 
# 汎用処理 軸合わせ角度計算
#
# @within function mhdp_monsters:/**
# @input score #mhdp_temp_rotate_tick MhdpCore 回転にかける時間

# 対象との角度差を計算
    summon marker ~ ~ ~ {Tags:["Temp.Rotate.Target.Marker"]}
    execute at @s facing entity @n[tag=Temp.Rotate.Target] feet rotated ~ 0 run tp @n[type=marker,tag=Temp.Rotate.Target.Marker,limit=1] ~ ~ ~ ~ ~
    execute store result score #mhdo_temp_rotate MhdpCore run data get entity @s Rotation[0] 1000
    execute store result score @s Mns.Temp.RotateVec run data get entity @n[type=marker,tag=Temp.Rotate.Target.Marker,limit=1] Rotation[0] 1000
    scoreboard players operation @s Mns.Temp.RotateVec -= #mhdo_temp_rotate MhdpCore
    execute if score @s Mns.Temp.RotateVec matches 180000.. run scoreboard players remove @s Mns.Temp.RotateVec 360000
    execute if score @s Mns.Temp.RotateVec matches ..-180000 run scoreboard players add @s Mns.Temp.RotateVec 360000
    execute if score @s Mns.Temp.RotateVec matches 90000.. run scoreboard players set @s Mns.Temp.RotateVec 90000
    execute if score @s Mns.Temp.RotateVec matches ..-90000 run scoreboard players set @s Mns.Temp.RotateVec -90000
    scoreboard players operation @s Mns.Temp.RotateVec /= #mhdp_temp_rotate_tick MhdpCore

# 終了
    kill @e[type=marker,tag=Temp.Rotate.Target.Marker]
    scoreboard players reset #mhdo_temp_rotate MhdpCore
