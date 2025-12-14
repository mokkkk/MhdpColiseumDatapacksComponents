#> assets:object/1001.normal_tower/tick/expand
#
# tick処理

# 紐づけ対象取得
    execute store result storage api: Arg.Uid int 1 run scoreboard players get @s Build.Uid
    data modify storage api: Arg.Type set value "item_display"
    data modify storage api: Arg.Tag set value "Asset.Build.Display"
    function assets:core/object/build/get_link_target.m with storage api: Arg

# 拡大
    execute as @n[type=item_display,tag=Asset.Build.Target,tag=Asset.Build.Display.A] run function assets:core/object/build/expand_model.m {TX:0f,TY:1f,TZ:0f,SX:2f,SY:2f,SZ:2f}
    execute as @n[type=item_display,tag=Asset.Build.Target,tag=Asset.Build.Display.B] run function assets:core/object/build/expand_model.m {TX:0f,TY:3f,TZ:0f,SX:2f,SY:2f,SZ:2f}
    execute as @n[type=item_display,tag=Asset.Build.Target,tag=Asset.Build.Display.C] run function assets:core/object/build/expand_model.m {TX:0f,TY:5f,TZ:0f,SX:2f,SY:2f,SZ:2f}
    tag @e[type=item_display,tag=Asset.Build.Target] remove Asset.Build.Target

# 演出
    playsound block.shulker_box.open master @a ~ ~ ~ 1 1.6

# 上にいるプレイヤーを飛ばす
    execute positioned ~-1.25 ~ ~-1.25 as @a[dx=2.5,dy=0.5,dz=2.5] at @s run function assets:core/object/build/expand_jump
