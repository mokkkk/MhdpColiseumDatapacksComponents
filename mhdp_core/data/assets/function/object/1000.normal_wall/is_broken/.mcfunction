#> assets:object/1000.normal_wall/is_broken/
#
# 破壊時処理

# 状態変更
    tag @s add Asset.Build.IsBroken

# モデル消去までの時間を決定
    scoreboard players set @s ObjectTick 0
    scoreboard players set @s Build.RemoveTick 0

# 当たり判定エンティティ消去
    # 当たり判定
        execute store result storage api: Arg.Uid int 1 run scoreboard players get @s Build.Uid
        data modify storage api: Arg.Type set value "shulker"
        data modify storage api: Arg.Tag set value "Asset.Build.HitBox"
        function assets:core/object/build/get_link_target.m with storage api: Arg
        tp @e[type=shulker,tag=Asset.Build.Target] ~ ~-100 ~
        kill @e[type=shulker,tag=Asset.Build.Target]
