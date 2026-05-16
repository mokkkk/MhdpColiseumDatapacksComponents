#> km_bounding:zz/cone/detect.m
#
# @within function km_bounding:cone/

# マクロと幾何学で判定
    $execute as $(selector) facing entity @s feet positioned as @s positioned ^ ^ ^0.5 rotated as 314-0-3bd-0-161 positioned ^ ^ ^-0.5 if entity @s[distance=..$(sin)] run tag @s add bounding_cone