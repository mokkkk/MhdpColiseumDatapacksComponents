#> mhdp_monsters:core/util/tick/move/check_height.m
# 
# 汎用処理 Y座標確認
#
# @within function mhdp_monsters:core/util/tick/tick

# 比較
    execute store result score #temp_current_height MhdpCore run data get storage mhdp_core:temp MonsterTemp.CurrentPos.Height
    execute if score #temp_current_height MhdpCore < @s Fld.Height run function mhdp_monsters:core/util/tick/move/adjust_height
    scoreboard players reset #temp_current_height MhdpCore
