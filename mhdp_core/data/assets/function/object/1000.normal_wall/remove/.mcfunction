#> assets:object/1000.normal_wall/remove/
#
# remove処理

# 紐づけ先エンティティ消去
    # 当たり判定
        execute store result storage api: Arg.Uid int 1 run scoreboard players get @s Build.Uid
        data modify storage api: Arg.Type set value "shulker"
        data modify storage api: Arg.Tag set value "Asset.Build.HitBox"
        function assets:core/object/build/get_link_target.m with storage api: Arg
        tp @e[type=shulker,tag=Asset.Build.Target] ~ ~-100 ~
        kill @e[type=shulker,tag=Asset.Build.Target]
    # 見た目
        execute store result storage api: Arg.Uid int 1 run scoreboard players get @s Build.Uid
        data modify storage api: Arg.Type set value "item_display"
        data modify storage api: Arg.Tag set value "Asset.Build.Display"
        function assets:core/object/build/get_link_target.m with storage api: Arg
        kill @e[type=item_display,tag=Asset.Build.Target]

# 自身を消去
    kill @s
