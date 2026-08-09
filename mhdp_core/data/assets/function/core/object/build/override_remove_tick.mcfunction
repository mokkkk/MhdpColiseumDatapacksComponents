#> assets:core/object/build/override_remove_tick
#
# 紐づけ

# Rootエンティティ取得
    execute store result storage api: Arg.Uid int 1 run scoreboard players get @s Build.Uid
    data modify storage api: Arg.Type set value "item_display"
    data modify storage api: Arg.Tag set value "Asset.Build.Root"
    function assets:core/object/build/get_link_target.m with storage api: Arg
    execute as @n[type=item_display,tag=Asset.Build.Target] store result score @s Build.RemoveTick run data get storage api: Return.OverrideRemoveTick
