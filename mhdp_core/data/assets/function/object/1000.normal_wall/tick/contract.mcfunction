#> assets:object/1000.normal_wall/tick/contract
#
# tick処理

# 紐づけ対象取得
    execute store result storage api: Arg.Uid int 1 run scoreboard players get @s Build.Uid
    data modify storage api: Arg.Type set value "item_display"
    data modify storage api: Arg.Tag set value "Asset.Build.Display"
    function assets:core/object/build/get_link_target.m with storage api: Arg

# 縮小
    execute as @e[type=item_display,tag=Asset.Build.Target] run function assets:core/object/build/contract_model.m {TX:1f,TY:-1f,TZ:0f,SX:0.0f,SY:0.0f,SZ:0.0f}
    tag @e[type=item_display,tag=Asset.Build.Target] remove Asset.Build.Target

# 演出
    playsound minecraft:block.scaffolding.break master @a ~ ~ ~ 1 0.7
    playsound minecraft:block.scaffolding.break master @a ~ ~ ~ 1 0.6
    playsound block.shulker_box.close master @a ~ ~ ~ 1 1.6
