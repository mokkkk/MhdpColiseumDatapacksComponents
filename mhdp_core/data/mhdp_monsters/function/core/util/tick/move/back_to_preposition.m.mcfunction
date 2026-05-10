#> mhdp_monsters:core/util/tick/move/back_to_preposition.m
# 
# 汎用処理 前Pos方向に移動する
#
# @within function mhdp_monsters:core/util/tick/tick

# 埋まらない位置まで平行移動
    $summon area_effect_cloud $(X) $(Y) $(Z) {Tags:["Temp.BackPos"]}
    execute facing entity @n[type=area_effect_cloud,tag=Temp.BackPos] feet rotated ~ 0 positioned as @s run function mhdp_monsters:core/util/tick/move/move_loop
    scoreboard players reset #mhdp_back_count MhdpCore
    kill @n[type=area_effect_cloud,tag=Temp.BackPos]
