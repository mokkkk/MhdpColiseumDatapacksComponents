#> assets:core/object/build/update_model_destroy_1
#
# モデル更新

# 紐づけ
    # 見た目
        execute store result storage api: Arg.Uid int 1 run scoreboard players get @s Build.Uid
        data modify storage api: Arg.Type set value "item_display"
        data modify storage api: Arg.Tag set value "Asset.Build.Display"
        function assets:core/object/build/get_link_target.m with storage api: Arg
    
# モデル更新
    execute as @e[type=item_display,tag=Asset.Build.Target] run data modify entity @s item.components."minecraft:custom_model_data" set value {strings:["destroy_1"]}

# スコア更新
    scoreboard players set @s Build.Stats.DestroyLevel 2

# 終了
    tag @e[type=item_display,tag=Asset.Build.Target] remove Asset.Build.Target
