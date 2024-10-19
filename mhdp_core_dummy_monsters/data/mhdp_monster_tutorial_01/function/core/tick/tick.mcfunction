#> mhdp_monster_tutorial_01:core/tick/tick
#
# tick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# # メイン処理
#     function mhdp_monster_tutorial_01:core/tick/tick_main

# # 怒り中、一定時間ごとにメイン処理を再度実行
#     execute if entity @s[tag=Mns.State.IsAnger] run scoreboard players add @s Mns.Temp.AngerSpeed.Timer 1
#     execute if entity @s[tag=!Mns.State.IsDisableAngerSpeed] if score @s Mns.Temp.AngerSpeed.Timer >= @s Mns.Anger.Speed at @s run function mhdp_monster_tutorial_01:core/tick/tick_main
#     execute if score @s Mns.Temp.AngerSpeed.Timer >= @s Mns.Anger.Speed run scoreboard players set @s Mns.Temp.AngerSpeed.Timer 0

# # 弾処理
#     execute as @e[type=item_display,tag=Mns.Shot.tutorial_01] at @s run function mhdp_monster_tutorial_01:core/tick/shot/tick

# test
    scoreboard players add @s Mns.General.DummyTimer 1
    execute if score @s Mns.General.DummyTimer matches 2 run say チュートリアルです
    execute if score @s Mns.General.DummyTimer matches 62 run say さようなら
    execute if score @s Mns.General.DummyTimer matches 122 run function mhdp_monster_tutorial_01:core/death/death
