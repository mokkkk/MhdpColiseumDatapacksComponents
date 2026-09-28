#> assets:object/10045.valk_beam/init/apply_scale.m
#
# @within function assets:object/10045.valk_beam/init/
# @input arg Scale 整数スケール

    $data modify entity @s transformation.scale set value [$(Scale)f,$(Scale)f,$(Scale)f]
