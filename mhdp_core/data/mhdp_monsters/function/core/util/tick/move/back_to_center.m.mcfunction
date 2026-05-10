#> mhdp_monsters:core/util/tick/move/back_to_center.m
# 
# 汎用処理 フィールド中心方向に移動する
#
# @within function mhdp_monsters:core/util/tick/tick

# 埋まらない位置まで平行移動
    $execute facing entity @n[type=marker,tag=Mk.Field.AreaCenter,tag=Mk.Field.Area$(AreaId),limit=1] feet rotated ~ 0 positioned as @s run function mhdp_monsters:core/util/tick/move/move_loop
    scoreboard players reset #mhdp_back_count MhdpCore
