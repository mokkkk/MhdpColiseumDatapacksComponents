#> mhdp_monsters:core/util/tick/move/back_to_preposition
# 
# 汎用処理 前Pos方向に移動する
#
# @within function mhdp_monsters:core/util/tick/tick

# 埋まらない位置まで平行移動
    summon area_effect_cloud ~ ~ ~ {Tags:["Temp.BackPos"]}
    data modify entity @n[type=area_effect_cloud,tag=Temp.BackPos] Pos set from storage mhdp_core:temp MonsterTemp.PrePos
    execute facing entity @n[type=area_effect_cloud,tag=Temp.BackPos] feet rotated ~ 0 positioned as @s run function mhdp_monsters:core/util/tick/move/back_to_preposition_loop
    kill @n[type=area_effect_cloud,tag=Temp.BackPos]
