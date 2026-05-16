#> km_bounding:zz/cake/cylinder.m
#
# @within function km_bounding:cake/

# マクロと幾何学で判定
    $execute as $(selector) if predicate {condition:"entity_properties",entity:"this",predicate:{location:{position:{y:{min:$(y_bottom),max:$(y_top)}}},distance:{horizontal:{max:$(radius)}}}} run function km_bounding:zz/cake/flat_$(function).m with storage km_bounding: cake.macro