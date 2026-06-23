#> assets:object/0015.nikuyaki/tick/on_model
#
# オブジェクトのtick処理
#
# @within function mhdp_items:/**

# remove予約されている場合、削除
# TODO: この処理はどの場合に呼び出される可能性があるか調査する。できればここで実行したくない
    # execute if entity @s[tag=Itm.Root.Nikuyaki.Remove] as @p[tag=Ply.Temp.Target] run ride @s dismount
    # execute if entity @s[tag=Itm.Root.Nikuyaki.Remove] run function animated_java_nikuyaki:nikuyaki/remove/this

# 椅子にプレイヤーが座っている場合、オブジェクトの残存時間を延ばす
    function animated_java_nikuyaki:nikuyaki/as_locator {name: "chair", command: "execute on passengers if entity @s[type=player] run scoreboard players set @n[type=item_display,tag=This] ObjectTick 0"}

# アニメーション処理実行
    function animated_java:global/data_manager/on_tick
    function animated_java:global/root/on_tick

# スコア増加
    scoreboard players add @s MhdpCore 1
    scoreboard players add @s Mns.General.DummyTimer 1

# モデル変更
    execute if score @s MhdpCore matches 80 run function animated_java_nikuyaki:nikuyaki/as_node {name: "meat", command: "data modify entity @s item.components.\"minecraft:item_model\" set value \"minecraft:aj_sub/nikuyaki/meat\""}
    execute if score @s MhdpCore matches 80 run function animated_java_nikuyaki:nikuyaki/as_node {name: "meat", command: "data modify entity @s item.components.\"minecraft:custom_model_data\".strings set value [\"half_cooked\"]"}
    execute if score @s MhdpCore matches 170 run function animated_java_nikuyaki:nikuyaki/as_node {name: "meat", command: "data modify entity @s item.components.\"minecraft:custom_model_data\".strings set value [\"cooked\"]"}
    execute if score @s MhdpCore matches 180 run function animated_java_nikuyaki:nikuyaki/as_node {name: "meat", command: "data modify entity @s item.components.\"minecraft:custom_model_data\".strings set value [\"burnt\"]"}

# 演出
    execute if score @s Mns.General.DummyTimer matches 1 run particle smoke ~ ~1 ~ 0.4 0.4 0.4 0 1
    execute if score @s Mns.General.DummyTimer matches 5 run particle smoke ~ ~1 ~ 0.4 0.4 0.4 0 1
    execute if score @s Mns.General.DummyTimer matches 10 run particle smoke ~ ~1 ~ 0.4 0.4 0.4 0 1
    execute if score @s Mns.General.DummyTimer matches 6 run playsound block.fire.ambient master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7
    execute if score @s Mns.General.DummyTimer matches 10 run playsound block.campfire.crackle master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1
    execute if score @s Mns.General.DummyTimer matches 15.. run scoreboard players set @s Mns.General.DummyTimer 0
