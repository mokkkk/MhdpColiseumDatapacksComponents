#> api:damage_player_to_entity/vfx/summon_vfx.m
#
# ヒット演出
#
# @within function api:damage_player_to_entity/vfx

# データ設定
    data modify storage api: Arg.Override.Tag set from storage api: Arg.VfxType
    # 相殺成功時の上書き
        execute if data storage api: Return{Counter:true} if score #mhdp_temp_damage_phys_type MhdpCore matches 0 run data modify storage api: Arg.Override.Tag set value "slash_counter"
        execute if data storage api: Return{Counter:true} if score #mhdp_temp_damage_phys_type MhdpCore matches 1 run data modify storage api: Arg.Override.Tag set value "blow_counter"
    data modify storage api: Arg.Override.IsCounter set from storage api: Return.Counter
    data modify storage api: Arg.Override.Rotation set from storage mhdp_core:temp Arg.VfxRotation
    data modify storage api: Arg.Override.Scale set from storage api: Arg.VfxScale

# 召喚
    $execute positioned ~ ~$(OffsetY) ~ rotated ~$(RotY) ~$(RotX) positioned ^ ^ ^$(Dist) facing entity @s eyes positioned ^ ^ ^$(OffsetZ) run function api:object/summon.m {ObjectId:7}
    
    # $execute if data storage api: Arg{VfxRandom:1} positioned ~ ~$(OffsetY) ~ rotated ~$(RotY) ~$(RotX) positioned ^ ^ ^$(Dist) facing entity @s eyes positioned ^ ^ ^$(OffsetZ) run function api:object/summon.m {ObjectId:7}
    # $execute unless data storage api: Arg{VfxRandom:1} positioned ~ ~$(OffsetY) ~ facing entity @s eyes positioned ^ ^ ^$(OffsetZ) run function api:object/summon.m {ObjectId:7}
    # $execute positioned ~ ~$(OffsetY) ~ rotated as @s positioned ^ ^ ^2000 facing entity @s eyes positioned ^ ^ ^2000 facing entity @s eyes positioned ^ ^ ^$(OffsetZ) run function api:object/summon.m {ObjectId:7}
