#> mhdp_core:phase/1_village/villager/tutorial/main
#
# 村のtick処理
#
# @within function mhdp_core:tick

# タイマー増加
    scoreboard players add @s Vlg.General.Timer 1

# 挨拶
    execute if score @s Vlg.General.Timer matches 60 run function mhdp_core:phase/1_village/villager/tutorial/0_greeting/main

# 武器の装備
    execute if score @s Vlg.General.Timer matches 260 run function mhdp_core:phase/1_village/villager/tutorial/1_weapon/main

# 訓練所
    execute if score @s Vlg.General.Timer matches 460 run function mhdp_core:phase/1_village/villager/tutorial/2_training/main

# クエスト受注
    execute if score @s Vlg.General.Timer matches 660 run function mhdp_core:phase/1_village/villager/tutorial/3_quest_accept/main

# クエスト参加
    execute if score @s Vlg.General.Timer matches 860 run function mhdp_core:phase/1_village/villager/tutorial/4_quest_join/main

# クエスト出発
    execute if score @s Vlg.General.Timer matches 1060 run function mhdp_core:phase/1_village/villager/tutorial/5_quest_start/main

# サブタイマー
    scoreboard players add @s MhdpCore 1
    execute if score @s MhdpCore matches 10.. as @e[type=text_display,tag=Other.Text.Tutorial] run data modify entity @s text set value '{"text":"↓","color":"white"}'
    execute if score @s MhdpCore matches 20.. as @e[type=text_display,tag=Other.Text.Tutorial] run data modify entity @s text set value '{"text":"↓","color":"red"}'
    execute if score @s MhdpCore matches 20.. run scoreboard players set @s MhdpCore 0

# 終了
    execute if score @s Vlg.General.Timer matches 1260.. run kill @e[type=text_display,tag=Other.Text.Tutorial]
    execute if score @s Vlg.General.Timer matches 1260.. run kill @s
