#> assets:object/1000.normal_wall/tick/expand
#
# tick処理

# 紐づけ対象取得
    execute store result storage api: Arg.Uid int 1 run scoreboard players get @s Build.Uid
    data modify storage api: Arg.Type set value "item_display"
    data modify storage api: Arg.Tag set value "Asset.Build.Display"
    function assets:core/object/build/get_link_target.m with storage api: Arg

# 拡大
    execute as @e[type=item_display,tag=Asset.Build.Target] run function assets:core/object/build/expand_model.m {TX:0f,TY:1.25f,TZ:0f,SX:2.5f,SY:2.5f,SZ:2.5f}
    # execute as @e[type=item_display,tag=Asset.Build.Target] run data modify entity @s transformation.translation set value [0f,1.25f,0f]
    # execute as @e[type=item_display,tag=Asset.Build.Target] run data modify entity @s transformation.scale set value [2.5f,2.5f,2.5f]
    # execute as @e[type=item_display,tag=Asset.Build.Target] run data modify entity @s start_interpolation set value 0
    tag @e[type=item_display,tag=Asset.Build.Target] remove Asset.Build.Target

# 演出
    playsound block.shulker_box.open master @a ~ ~ ~ 1 1.6

# 上にいるプレイヤーを飛ばす
    execute positioned ~-1.25 ~ ~-1.25 as @a[dx=2.5,dy=0.5,dz=2.5] at @s run function assets:core/object/build/expand_jump
