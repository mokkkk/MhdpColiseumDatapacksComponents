#> mhdp_monsters:core/util/other/move_to_target_move
# 
# 汎用処理 ターゲットまで移動
#
# @within function mhdp_monsters:/**

# 回転
    execute store result storage mhdp_core:temp Temp.X double 0.001 run scoreboard players get @s Mns.Temp.MoveVec.X
    execute store result storage mhdp_core:temp Temp.Y double 0.001 run scoreboard players get @s Mns.Temp.MoveVec.Y
    execute store result storage mhdp_core:temp Temp.Z double 0.001 run scoreboard players get @s Mns.Temp.MoveVec.Z
    function mhdp_monsters:core/util/other/macro/m.move_to_target_move with storage mhdp_core:temp Temp
    data remove storage mhdp_core:temp Temp
