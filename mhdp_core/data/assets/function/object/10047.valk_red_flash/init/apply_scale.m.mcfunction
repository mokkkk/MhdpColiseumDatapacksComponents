#> assets:object/10047.valk_red_flash/init/apply_scale.m
#
# @within function assets:object/10047.valk_red_flash/init/
# @input arg Scale 整数スケール

    $data modify entity @s transformation.scale set value [$(Scale)f,$(Scale)f,$(Scale)f]
