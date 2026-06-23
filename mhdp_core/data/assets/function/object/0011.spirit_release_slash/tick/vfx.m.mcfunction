#> assets:object/0011.spirit_release_slash/tick/vfx.m
#
# 練気解放無双斬りの召喚処理
#
# @within function assets:object/0011.spirit_release_slash/tick/

# 演出用VFXオブジェクト召喚
    # データ設定
        data modify storage api: Arg.Override.Tag set value "slash_strong"
        data modify storage api: Arg.Override.IsCounter set value false
        $data modify storage api: Arg.Override.Rotation set value $(VfxRandomRotation)
        $data modify storage api: Arg.Override.Scale set value [3f,$(VfxRandomLength)f,3f]
    # 召喚
        $execute positioned ^$(VfxRandomX) ^$(VfxRandomY) ^$(VfxRandomZ) facing entity @s eyes run function api:object/summon.m {ObjectId:7}
