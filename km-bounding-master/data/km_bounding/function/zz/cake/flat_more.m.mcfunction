#> km_bounding:zz/cake/flat_more.m
#
# @within function km_bounding:zz/cake/cylinder.m
# 180°より大きい時の判定処理

# plane/.ifを使い角度判定
    $execute rotated ~-90 0 rotated ~$(angle_plus) 0 if function km_bounding:plane/.if run return run tag @s add bounding_cake
    $execute rotated ~90 0 rotated ~-$(angle_minus) 0 if function km_bounding:plane/.if run return run tag @s add bounding_cake