#> assets:object/10042.valk_comet_burst/init/apply_scale.m
#
# @within function assets:object/10042.valk_comet_burst/init/
# @input arg Scale 整数スケール（X/Y のみ。平面表示のため Z は 1 固定）

    $data modify entity @s transformation.scale set value [$(Scale)f,$(Scale)f,1f]
