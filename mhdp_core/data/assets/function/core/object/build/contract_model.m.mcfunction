#> assets:core/object/build/contract_model.m
#
# モデル縮小

# 値設定
    data modify entity @s interpolation_duration set value 14
    $data modify entity @s transformation.translation set value [$(TX),$(TY),$(TZ)]
    $data modify entity @s transformation.scale set value [$(SX),$(SY),$(SZ)]
    data modify entity @s start_interpolation set value 0

# ランダム回転
    execute store result storage mhdp_core:temp ObjectTemp.Rotation.Angle float 0.1 run random value -1800..1800
    execute store result storage mhdp_core:temp ObjectTemp.Rotation.Axis float 0.1 run random value -10..10
    function assets:core/object/build/contract_model_rotation.m with storage mhdp_core:temp ObjectTemp.Rotation
    data remove storage mhdp_core:temp ObjectTemp.Rotation
