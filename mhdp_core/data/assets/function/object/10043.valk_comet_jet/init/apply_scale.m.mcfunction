#> assets:object/10043.valk_comet_jet/init/apply_scale.m
#
# @within function assets:object/10043.valk_comet_jet/init/
# @input arg Scale 整数スケール

    $data modify entity @s transformation.scale set value [$(Scale)f,$(Scale)f,$(Scale)f]
