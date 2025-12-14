#> assets:core/object/build/expand_model.m
#
# モデル拡大

# 値設定
    $data modify entity @s transformation.translation set value [$(TX),$(TY),$(TZ)]
    $data modify entity @s transformation.scale set value [$(SX),$(SY),$(SZ)]
    data modify entity @s start_interpolation set value 0