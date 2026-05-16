#> km_bounding:zz/cuboid/corner_minus
#
# @within function km_bounding:zz/cuboid/*

# -X,-Y,-Z方向に範囲外のエンティティを除外
    execute facing entity @s feet positioned as @s positioned ^ ^ ^3 rotated as 314-0-3bd-0-161 positioned ^-4 ^ ^ if entity @s[distance=5..] run return fail
    execute facing entity @s feet positioned as @s positioned ^ ^ ^3 rotated as 314-0-3bd-0-161 positioned ^ ^-4 ^ if entity @s[distance=5..] run return fail
    execute facing entity @s feet positioned as @s positioned ^ ^ ^3 rotated as 314-0-3bd-0-161 positioned ^ ^ ^-4 if entity @s[distance=5..] run return fail

# 判定成功
    return 1
