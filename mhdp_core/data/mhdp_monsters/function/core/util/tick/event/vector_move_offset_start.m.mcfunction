#> mhdp_monsters:core/util/tick/event/vector_move_offset_start.m
# 
# 汎用処理 移動開始 オフセットまでの移動
#
# @input arg Tick 移動にかける時間
# @input arg OffsetX 移動位置のオフセット。移動するモンスター基準
# @input arg OffsetY 移動位置のオフセット。移動するモンスター基準
# @input arg OffsetZ 移動位置のオフセット。移動するモンスター基準
# @input arg IsAdjustLand 移動先の高さを地面に調整するかどうか 

# バグ対策の初期値
    scoreboard players set @s Mns.Temp.MoveVec.X 0
    scoreboard players set @s Mns.Temp.MoveVec.Y 0
    scoreboard players set @s Mns.Temp.MoveVec.Z 0

# ターゲット配置
    summon marker ~ ~ ~ {Tags:["Temp.Move.Target.Marker"]}
    $execute rotated ~ 0 positioned ^$(OffsetX) ^$(OffsetY) ^$(OffsetZ) run tp @n[type=marker,tag=Temp.Move.Target.Marker] ~ ~ ~

# ターゲットの高さ調整
    $data modify storage mhdp_core:temp Temp.IsAdjustLand set value $(IsAdjustLand)
    execute if data storage mhdp_core:temp Temp{IsAdjustLand:true} store result entity @n[type=marker,tag=Temp.Move.Target.Marker] Pos[1] float 1 run scoreboard players get @s Fld.Height

# 移動時間
    $scoreboard players set #mhdp_temp_move_tick MhdpCore $(Tick)

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

# 移動ベクトル計算
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
