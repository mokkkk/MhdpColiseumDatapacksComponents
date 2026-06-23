#> assets:object/0015.nikuyaki/init/
#
# オブジェクト初期化処理

# 移動
    tp @s ~ ~ ~ ~ ~

# モデル召喚
    function animated_java_nikuyaki:nikuyaki/summon {args: {animation: "baking", start_animation: true}}

# 自身にRideさせる
    ride @n[type=item_display,tag=Itm.Root.Nikuyaki,tag=!15.IsInit] mount @s
    execute on passengers run tag @s add 15.IsInit

# 名前を修正
    execute on passengers run function animated_java_nikuyaki:nikuyaki/as_locator {name: "interaction", command: "data modify entity @s CustomName set value \" \""}
    
# プレイヤーと紐づけ
    execute on passengers store result score @s Ply.Uid run data get storage api: Arg.Override.PlyUid
    execute on passengers run function animated_java_nikuyaki:nikuyaki/as_locator {name: "interaction", command: "execute store result score @s Ply.Uid run data get storage api: Arg.Override.PlyUid"}
