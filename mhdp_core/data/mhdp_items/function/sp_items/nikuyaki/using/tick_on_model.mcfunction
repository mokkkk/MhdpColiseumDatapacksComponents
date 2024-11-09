#> mhdp_items:sp_items/nikuyaki/using/tick_on_model
#
# 肉焼きセットの使用中処理
#
# @within function mhdp_items:sp_items/wirebug/tick

# アニメーション処理実行
    function animated_java:nikuyaki/root/on_tick

# スコア増加
    scoreboard players add @s MhdpCore 1
    scoreboard players add @s Mns.General.DummyTimer 1

# モデル変更
    execute if score @s MhdpCore matches 50 on passengers if entity @s[tag=aj.nikuyaki.bone.meat] run data modify entity @s item.id set value "minecraft:white_dye"
    execute if score @s MhdpCore matches 50 on passengers if entity @s[tag=aj.nikuyaki.bone.meat] run data modify entity @s item.components."minecraft:custom_model_data" set value 158
    execute if score @s MhdpCore matches 220 on passengers if entity @s[tag=aj.nikuyaki.bone.meat] run data modify entity @s item.components."minecraft:custom_model_data" set value 159
    execute if score @s MhdpCore matches 230 on passengers if entity @s[tag=aj.nikuyaki.bone.meat] run data modify entity @s item.components."minecraft:custom_model_data" set value 160

# 演出
    execute if score @s Mns.General.DummyTimer matches 1 run particle smoke ~ ~1 ~ 0.4 0.4 0.4 0 1
    execute if score @s Mns.General.DummyTimer matches 5 run particle smoke ~ ~1 ~ 0.4 0.4 0.4 0 1
    execute if score @s Mns.General.DummyTimer matches 10 run particle smoke ~ ~1 ~ 0.4 0.4 0.4 0 1
    execute if score @s Mns.General.DummyTimer matches 6 run playsound block.fire.ambient master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7
    execute if score @s Mns.General.DummyTimer matches 10 run playsound block.campfire.crackle master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1
    execute if score @s Mns.General.DummyTimer matches 15.. run scoreboard players set @s Mns.General.DummyTimer 0
