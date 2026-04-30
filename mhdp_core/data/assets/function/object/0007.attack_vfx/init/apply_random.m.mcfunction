#> assets:object/0007.attack_vfx/init/apply_random.m
#
# オブジェクト初期化処理

# 角度ランダム化
    $data modify entity @s transformation.left_rotation set value {axis:[0f,0f,1f],angle:$(Rotation)}
    $execute store result entity @s transformation.scale[0] float $(ScaleRandom) run data get storage api: Arg.Override.Scale
    $execute store result entity @s transformation.scale[1] float $(ScaleRandom) run data get storage api: Arg.Override.Scale
    $execute store result entity @s transformation.scale[2] float $(ScaleRandom) run data get storage api: Arg.Override.Scale
