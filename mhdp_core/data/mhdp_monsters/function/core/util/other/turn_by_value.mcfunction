#> mhdp_monsters:core/util/other/turn_by_value
# 
# 汎用処理 値を用いた回転
#
# @within function mhdp_monsters:/**

# 回転
    execute if score @s Mns.Temp.RotateValue matches 1.. run rotate @s ~2 ~
    execute if score @s Mns.Temp.RotateValue matches 1.. run scoreboard players remove @s Mns.Temp.RotateValue 1
    execute if score @s Mns.Temp.RotateValue matches ..-1 run rotate @s ~-2 ~
    execute if score @s Mns.Temp.RotateValue matches ..-1 run scoreboard players add @s Mns.Temp.RotateValue 1
    execute if score @s Mns.Temp.RotateValue matches 0 run scoreboard players reset @s Mns.Temp.RotateValue
