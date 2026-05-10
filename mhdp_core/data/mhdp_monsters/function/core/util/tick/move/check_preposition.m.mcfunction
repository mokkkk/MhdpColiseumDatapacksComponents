#> mhdp_monsters:core/util/tick/move/check_preposition.m
# 
# 汎用処理 前tick位置確認
#
# @within function mhdp_monsters:core/util/tick/tick

# 前tick位置は埋まっていない場合、前tick位置方向に向かって移動
    $execute positioned $(X) $(Y) $(Z) if block ~ ~ ~ #mhdp_core:no_collision run return run function mhdp_monsters:core/util/tick/move/back_to_preposition.m with storage mhdp_core:temp MonsterTemp.PrePos

# 前tick位置もブロックに埋まっている場合、中心位置方向に向かって移動
    execute store result storage mhdp_core:temp MonsterTemp.CurrentArea.AreaId int 1 run scoreboard players get @s Fld.CurrentAreaId
    function mhdp_monsters:core/util/tick/move/back_to_center.m with storage mhdp_core:temp MonsterTemp.CurrentArea
