#> mhdp_monsters:core/util/tick/event/alignment
# 
# 汎用処理 軸合わせ実行
#
# @within function mhdp_monsters:/**

# 回転
    execute store result storage mhdp_core:temp Temp.Rotate double 0.001 run scoreboard players get @s Mns.Temp.RotateVec
    execute at @s run function mhdp_monsters:core/util/tick/event/alignment_apply.m with storage mhdp_core:temp Temp
    data remove storage mhdp_core:temp Temp
