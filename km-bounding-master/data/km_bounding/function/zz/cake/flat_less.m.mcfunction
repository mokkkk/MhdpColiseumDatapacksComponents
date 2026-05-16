#> km_bounding:zz/cake/flat_less.m
#
# @within function km_bounding:zz/cake/cylinder.m
# 180°以内の時の判定処理

# plane/.ifを使い角度判定
    $execute rotated ~90 0 rotated ~$(angle_plus) 0 if function km_bounding:plane/.if run return fail
    $execute rotated ~-90 0 rotated ~-$(angle_minus) 0 if function km_bounding:plane/.if run return fail

# 成功戻り値
    tag @s add bounding_cake