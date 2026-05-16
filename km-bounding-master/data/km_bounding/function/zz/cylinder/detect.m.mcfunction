#> km_bounding:zz/cylinder/detect.m
#
# @within function km_bounding:cylinder/

# マクロで判定
    $execute as $(selector) if predicate {condition:"entity_properties",entity:"this",predicate:{location:{position:{y:{min:$(y_bottom),max:$(y_top)}}},distance:{horizontal:{max:$(radius)}}}} run tag @s add bounding_cylinder