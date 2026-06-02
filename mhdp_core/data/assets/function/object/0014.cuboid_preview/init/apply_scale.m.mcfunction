#> assets:object/0014.cuboid_preview/init/apply_scale.m
#
# オブジェクト初期化処理

# scale適用
    $data modify entity @s transformation.scale set value [$(TransScaleX),$(TransScaleY),$(TransScaleZ)]

# color適用
    $data modify entity @s item.id set value "minecraft:$(Color)_stained_glass"
