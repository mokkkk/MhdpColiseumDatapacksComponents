#> assets:object/10041.valk_comet/init/apply_scale.m
#
# @within function assets:object/10041.valk_comet/init/
# @input arg Scale 整数スケール（X/Y のみ。平面表示のため Z は 1 固定）

    $data modify entity @s transformation.scale set value [$(Scale)f,$(Scale)f,1f]
