#> mhdp_monsters:core/util/tick/move/back_to_preposition
# 
# 汎用処理 前Posに移動する
#
# @within function mhdp_monsters:core/util/tick/tick

# Y座標をフィールドY座標に合わせる
    say TODO: Y座標合わせる処理

# 埋まらない位置まで平行移動
    summon area_effect_cloud ~ ~ ~ {Tags:["Temp.BackPos"]}
    data modify entity @n[type=area_effect_cloud,tag=Temp.BackPos] Pos set from storage mhdp_core:temp MonsterTemp.PrePos
    execute facing entity @n[type=area_effect_cloud,tag=Temp.BackPos] feet rotated ~ 0 run function mhdp_monsters:core/util/tick/move/back_to_preposition_loop
    kill @n[type=area_effect_cloud,tag=Temp.BackPos]

# PrePos更新
    function mhdp_monsters:core/util/tick/move/save_position
