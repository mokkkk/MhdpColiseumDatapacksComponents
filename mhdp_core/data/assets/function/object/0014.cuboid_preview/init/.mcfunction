#> assets:object/0014.cuboid_preview/init/
#
# オブジェクト初期化処理

# 移動
    tp @s ~ ~ ~ ~ ~

# scale適用
    execute store result score #mhdp_temp_obj MhdpCore run data get storage api: Arg.Override.X 2000
    execute store result storage api: Arg.Override.TransScaleX double 0.001 run scoreboard players get #mhdp_temp_obj MhdpCore
    execute store result score #mhdp_temp_obj MhdpCore run data get storage api: Arg.Override.Y 2000
    execute store result storage api: Arg.Override.TransScaleY double 0.001 run scoreboard players get #mhdp_temp_obj MhdpCore
    execute store result score #mhdp_temp_obj MhdpCore run data get storage api: Arg.Override.Z 2000
    execute store result storage api: Arg.Override.TransScaleZ double 0.001 run scoreboard players get #mhdp_temp_obj MhdpCore
    function assets:object/0014.cuboid_preview/init/apply_scale.m with storage api: Arg.Override
