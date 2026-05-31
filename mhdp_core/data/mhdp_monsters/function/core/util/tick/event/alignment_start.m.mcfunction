#> mhdp_monsters:core/util/tick/event/alignment_start.m
# 
# 汎用処理 軸合わせ開始
#
# @within function mhdp_monsters:/**

# 対象との角度差を計算
    summon marker ~ ~ ~ {Tags:["Temp.Rotate.Target.Marker"]}
    $execute at @s facing entity @n[tag=$(TargetTag)] feet rotated ~ 0 run tp @n[type=marker,tag=Temp.Rotate.Target.Marker,limit=1] ~ ~ ~ ~ ~
    execute store result score #mhdp_temp_rotate MhdpCore run data get entity @s Rotation[0] 1000
    execute store result score @s Mns.Temp.RotateVec run data get entity @n[type=marker,tag=Temp.Rotate.Target.Marker,limit=1] Rotation[0] 1000
    scoreboard players operation @s Mns.Temp.RotateVec -= #mhdp_temp_rotate MhdpCore

# 鋭角に調整
    execute if score @s Mns.Temp.RotateVec matches 180000.. run scoreboard players remove @s Mns.Temp.RotateVec 360000
    execute if score @s Mns.Temp.RotateVec matches ..-180000 run scoreboard players add @s Mns.Temp.RotateVec 360000

# 回転時間で割る
    $scoreboard players set #mhdp_temp_rotate_tick MhdpCore $(Tick)
    scoreboard players operation @s Mns.Temp.RotateVec /= #mhdp_temp_rotate_tick MhdpCore

# 終了
    kill @e[type=marker,tag=Temp.Rotate.Target.Marker]
    scoreboard players reset #mhdp_temp_rotate MhdpCore
    scoreboard players reset #mhdp_temp_rotate_tick MhdpCore
