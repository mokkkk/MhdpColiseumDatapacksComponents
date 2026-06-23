#> assets:object/0015.nikuyaki/init/
#
# オブジェクト初期化処理

# 移動
    tp @s ~ ~ ~ ~ ~

# モデル召喚
    function animated_java_nikuyaki:nikuyaki/summon {args: {animation: "baking", start_animation: true}}

# 自身にRideさせる
    ride @n[type=item_display,tag=Itm.Root.Nikuyaki,tag=!15.IsInit] mount @s
    execute on passengers if entity @s[type=item_display,tag=Itm.Root.Nikuyaki] run tag @s add 15.IsInit
    
# プレイヤーと紐づけ
    # execute store result score @n[type=item_display,tag=Itm.Root,tag=Itm.Root.Nikuyaki,tag=Itm.Root.Nikuyaki.Start] Ply.Uid run data get storage api: Arg.Override.PlyUid
    # execute store result score @n[type=interaction,tag=Other.Interaction.Meat,tag=!Other.Interaction.Meat.IsInit] Ply.Uid run data get storage api: Arg.Override.PlyUid
    # scoreboard players set @n[type=item_display,tag=Itm.Root,tag=Itm.Root.Nikuyaki,tag=Itm.Root.Nikuyaki.Start] Mns.General.DummyCounter 10
