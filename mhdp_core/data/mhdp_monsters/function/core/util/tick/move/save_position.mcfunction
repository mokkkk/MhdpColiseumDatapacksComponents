#> mhdp_monsters:core/util/tick/move/save_position
# 
# 汎用処理 現在位置の保持
#
# @within function mhdp_monsters:core/util/tick/tick

# 現在位置を保持
    data modify storage mhdp_core:temp MonsterTemp.PrePos set from entity @s Pos
