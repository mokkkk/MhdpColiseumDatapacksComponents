#> mhdp_items:weapons/short_sword/type_tec/1_spear_1/effect.m
#
# 突き1 攻撃判定
#
# @within function mhdp_items:weapons/great_sword/type_tec/1_charge/change_to_chargeattack

# 演出用VFXオブジェクト召喚
    # データ設定
        data modify storage api: Arg.Override.Tag set value "slash_strong"
        data modify storage api: Arg.Override.IsCounter set value false
        $data modify storage api: Arg.Override.Rotation set value $(Rotation)
        data modify storage api: Arg.Override.Scale set value [3f,12f,3f]
    # 召喚
        $execute positioned ~ ~1.65 ~ positioned ^$(PosX) ^$(PosY) ^3.5 facing entity @s eyes run function api:object/summon.m {ObjectId:7}
