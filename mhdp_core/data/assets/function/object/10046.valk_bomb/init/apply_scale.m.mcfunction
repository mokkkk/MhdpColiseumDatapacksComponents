#> assets:object/10046.valk_bomb/init/apply_scale.m
#
# @within function assets:object/10046.valk_bomb/init/
# @input arg Scale 整数スケール

    $data modify entity @s transformation.scale set value [$(Scale)f,$(Scale)f,$(Scale)f]
