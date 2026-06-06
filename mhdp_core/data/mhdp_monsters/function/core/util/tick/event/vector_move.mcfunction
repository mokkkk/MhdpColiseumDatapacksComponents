#> mhdp_monsters:core/util/tick/event/vector_move
# 
# 汎用処理 移動適用

# 移動
    execute store result storage mhdp_core:temp Temp.X double 0.001 run scoreboard players get @s Mns.Temp.MoveVec.X
    execute store result storage mhdp_core:temp Temp.Y double 0.001 run scoreboard players get @s Mns.Temp.MoveVec.Y
    execute store result storage mhdp_core:temp Temp.Z double 0.001 run scoreboard players get @s Mns.Temp.MoveVec.Z
    function mhdp_monsters:core/util/tick/event/vector_move_apply.m with storage mhdp_core:temp Temp
    data remove storage mhdp_core:temp Temp
