#> mhdp_monsters:core/util/tick/move/adjust_height
# 
# 汎用処理 Y座標をフィールドのY座標に合わせる
#
# @within function mhdp_monsters:core/util/tick/tick

# 実行
    execute store result entity @s Pos[1] float 1 run scoreboard players get @s Fld.Height

say adjust height