#> mhdp_monster_reus:core/tick/shot/tail/m.rotation
#
# 尻尾tick処理
#
# @within function mhdp_monster_reus:core/tick/shot/tail/tick

# 回転
    $data modify entity @s transformation.right_rotation set value {axis:[0f,0f,1f],angle:$(TailRotation)f}
