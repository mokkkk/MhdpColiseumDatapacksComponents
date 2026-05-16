#> km_bounding:zz/cuboid/geometry.m
#
# @within function km_bounding:cuboid/

# 幾何学で判定
    $execute as $(selector) positioned ^$(x_plus) ^$(y_plus) ^$(z_plus) if function km_bounding:zz/cuboid/corner_plus positioned ^-$(x_plus) ^-$(y_plus) ^-$(z_plus) positioned ^-$(x_minus) ^-$(y_minus) ^-$(z_minus) if function km_bounding:zz/cuboid/corner_minus run tag @s add bounding_cuboid

# 関数実行が成功した場合の戻り値
    return 1
