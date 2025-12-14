#> assets:object/1000.normal_wall/tick/expand
#
# tick処理

# 紐づけ対象取得
    execute store result storage api: Arg.Uid int 1 run scoreboard players get @s Build.Uid
    data modify storage api: Arg.Type set value "item_display"
    data modify storage api: Arg.Tag set value "Asset.Build.Display"
    function assets:core/object/build/get_link_target.m with storage api: Arg

# 拡大
    execute as @e[type=item_display,tag=Asset.Build.Target] run function assets:core/object/build/expand_model.m {TX:0f,TY:1.5f,TZ:0f,SX:3f,SY:3f,SZ:3f}
    tag @e[type=item_display,tag=Asset.Build.Target] remove Asset.Build.Target

# 演出
    playsound block.shulker_box.open master @a ~ ~ ~ 1 1.6

# 上にいるプレイヤーを飛ばす
    execute positioned ~-1.5 ~ ~-1.5 as @a[dx=3,dy=0.5,dz=3] at @s run function assets:core/object/build/expand_jump
