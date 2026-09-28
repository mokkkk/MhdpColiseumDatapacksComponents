#> assets:object/10048.valk_thunder/init/apply_scale.m
#
# @within function assets:object/10048.valk_thunder/init/
# @input arg Scale 整数スケール

    $data modify entity @s transformation.scale set value [$(Scale)f,$(Scale)f,$(Scale)f]
