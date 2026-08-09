#> assets:object/1001.normal_tower/tick/contract
#
# tick処理

# 紐づけ対象取得
    execute store result storage api: Arg.Uid int 1 run scoreboard players get @s Build.Uid
    data modify storage api: Arg.Type set value "item_display"
    data modify storage api: Arg.Tag set value "Asset.Build.Display"
    function assets:core/object/build/get_link_target.m with storage api: Arg

# 縮小
    execute as @n[type=item_display,tag=Asset.Build.Target,tag=Asset.Build.Display.A] run function assets:core/object/build/contract_model.m {TX:1f,TY:-0.5f,TZ:1f,SX:0.0f,SY:0.0f,SZ:0.0f}
    execute as @n[type=item_display,tag=Asset.Build.Target,tag=Asset.Build.Display.B] run function assets:core/object/build/contract_model.m {TX:3f,TY:-2f,TZ:2f,SX:0.0f,SY:0.0f,SZ:0.0f}
    execute as @n[type=item_display,tag=Asset.Build.Target,tag=Asset.Build.Display.C] run function assets:core/object/build/contract_model.m {TX:2f,TY:-3.5f,TZ:-3f,SX:0.0f,SY:0.0f,SZ:0.0f}
    tag @e[type=item_display,tag=Asset.Build.Target] remove Asset.Build.Target

# 演出
    playsound minecraft:block.scaffolding.break master @a ~ ~ ~ 1 0.7
    playsound minecraft:block.scaffolding.break master @a ~ ~ ~ 1 0.6
    playsound block.shulker_box.close master @a ~ ~ ~ 1 1.6
