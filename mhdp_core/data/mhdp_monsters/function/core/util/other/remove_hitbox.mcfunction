#> mhdp_monsters:core/util/other/remove_hitbox
# 
# 汎用処理 当たり判定の消去
#
# @within function mhdp_monsters:/**

# 原点に移動してから消去する
    data modify entity @s Size set value 0
    data merge entity @s {Tags:["Death"]}
    tp @s 0 0 0
    kill @s
