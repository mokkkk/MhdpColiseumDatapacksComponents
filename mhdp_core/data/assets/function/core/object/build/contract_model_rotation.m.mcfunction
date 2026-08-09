#> assets:core/object/build/contract_model_rotation.m
#
# モデル縮小

# 値設定
    $data modify entity @s transformation.left_rotation set value {axis:[1f,$(Axis)f,0f],angle:$(Angle)f}
    $rotate @s ~$(Angle) ~
