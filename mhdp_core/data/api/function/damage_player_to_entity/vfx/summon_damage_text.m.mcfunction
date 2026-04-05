#> api:damage_player_to_entity/vfx/summon_damage_text.m
#
# プレイヤーからモンスターに対してのダメージ処理 演出
#
# @within function api:damage_player_to_entity/vfx

# 位置をずらして召喚処理実行
    $execute positioned ~ ~$(OffsetY) ~ facing entity @s eyes positioned ^ ^ ^$(OffsetZ) rotated ~$(RotY) ~$(RotX) positioned ^ ^ ^$(Dist) run function api:object/summon.m {ObjectId:8}
    # $execute rotated as @s positioned ^ ^ ^2000 facing entity @s eyes positioned ^ ^ ^2000 facing entity @s eyes positioned ^ ^ ^$(OffsetZ) rotated ~$(RotY) ~$(RotX) positioned ^ ^ ^$(Dist) run function api:object/summon.m {ObjectId:8}
