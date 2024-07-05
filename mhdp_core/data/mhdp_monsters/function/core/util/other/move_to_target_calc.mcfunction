#> mhdp_monsters:core/util/other/move_to_target_calc
# 
# 汎用処理 ターゲットまで移動
#
# @within function mhdp_monsters:/**

# 移動対象がいない場合、処理中断
    execute unless entity @e[type=marker,tag=Temp.Move.Target.Marker] run return 0

# 対象との位置差を計算
    data modify storage mhdp_core:temp Temp.Origin set from entity @s Pos
    execute store result score #mhdp_temp_move Mns.Temp.MoveVec.X run data get storage mhdp_core:temp Temp.Origin[0] 1000
    execute store result score #mhdp_temp_move Mns.Temp.MoveVec.Y run data get storage mhdp_core:temp Temp.Origin[1] 1000
    execute store result score #mhdp_temp_move Mns.Temp.MoveVec.Z run data get storage mhdp_core:temp Temp.Origin[2] 1000
    data modify storage mhdp_core:temp Temp.Destination set from entity @n[type=marker,tag=Temp.Move.Target.Marker] Pos
    execute store result score @s Mns.Temp.MoveVec.X run data get storage mhdp_core:temp Temp.Destination[0] 1000
    execute store result score @s Mns.Temp.MoveVec.Y run data get storage mhdp_core:temp Temp.Destination[1] 1000
    execute store result score @s Mns.Temp.MoveVec.Z run data get storage mhdp_core:temp Temp.Destination[2] 1000
    scoreboard players operation @s Mns.Temp.MoveVec.X -= #mhdp_temp_move Mns.Temp.MoveVec.X
    scoreboard players operation @s Mns.Temp.MoveVec.Y -= #mhdp_temp_move Mns.Temp.MoveVec.Y
    scoreboard players operation @s Mns.Temp.MoveVec.Z -= #mhdp_temp_move Mns.Temp.MoveVec.Z
    scoreboard players operation @s Mns.Temp.MoveVec.X /= #mhdp_temp_move_tick MhdpCore
    scoreboard players operation @s Mns.Temp.MoveVec.Y /= #mhdp_temp_move_tick MhdpCore
    scoreboard players operation @s Mns.Temp.MoveVec.Z /= #mhdp_temp_move_tick MhdpCore

# 終了
    kill @e[type=marker,tag=Temp.Move.Target.Marker]
    scoreboard players reset #mhdp_temp_move Mns.Temp.MoveVec.X
    scoreboard players reset #mhdp_temp_move Mns.Temp.MoveVec.Y
    scoreboard players reset #mhdp_temp_move Mns.Temp.MoveVec.Z
    scoreboard players reset #mhdp_temp_move_tick MhdpCore
    data remove storage mhdp_core:temp Temp
