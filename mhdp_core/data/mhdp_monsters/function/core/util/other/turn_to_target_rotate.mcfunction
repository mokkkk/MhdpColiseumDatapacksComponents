#> mhdp_monsters:core/util/other/turn_to_target_rotate
# 
# 汎用処理 軸合わせ
#
# @within function mhdp_monsters:/**

# 回転
    execute store result storage mhdp_core:temp Temp.Rotate double 0.001 run scoreboard players get @s Mns.Temp.RotateVec
    function mhdp_monsters:core/util/other/macro/m.turn_to_target_rotate with storage mhdp_core:temp Temp
    data remove storage mhdp_core:temp Temp
