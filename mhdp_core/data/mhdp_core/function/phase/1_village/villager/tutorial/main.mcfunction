#> mhdp_core:phase/1_village/villager/tutorial/main
#
# 村のtick処理
#
# @within function mhdp_core:tick

# タイマー増加
    scoreboard players add @s Vlg.General.Timer 1
    execute if score @s Vlg.General.Timer matches 2 unless score @s Vlg.General.Counter matches 0.. run scoreboard players set @s Vlg.General.Counter 0

# 挨拶
    execute if score @s Vlg.General.Counter matches ..0 run function mhdp_core:phase/1_village/villager/tutorial/00_greeting

# 武器の装備
    execute if score @s Vlg.General.Counter matches 1 run function mhdp_core:phase/1_village/villager/tutorial/01_weapon_move
    execute if score @s Vlg.General.Counter matches 2 run function mhdp_core:phase/1_village/villager/tutorial/02_weapon_select

# 訓練所
    execute if score @s Vlg.General.Counter matches 3 run function mhdp_core:phase/1_village/villager/tutorial/03_training_move
    execute if score @s Vlg.General.Counter matches 4 run function mhdp_core:phase/1_village/villager/tutorial/04_training

# # クエスト受注
    execute if score @s Vlg.General.Counter matches 5 run function mhdp_core:phase/1_village/villager/tutorial/05_quest_accept_move
    execute if score @s Vlg.General.Counter matches 6 run function mhdp_core:phase/1_village/villager/tutorial/06_quest_accept

# # クエスト参加
    execute if score @s Vlg.General.Counter matches 7 run function mhdp_core:phase/1_village/villager/tutorial/07_quest_join_move
    execute if score @s Vlg.General.Counter matches 8 run function mhdp_core:phase/1_village/villager/tutorial/08_quest_join

# # クエスト出発
    execute if score @s Vlg.General.Counter matches 9 run function mhdp_core:phase/1_village/villager/tutorial/09_quest_start_move
    execute if score @s Vlg.General.Counter matches 10 run function mhdp_core:phase/1_village/villager/tutorial/10_quest_start

# サブタイマー
    scoreboard players add @s Vlg.General.Timer.Sub 1
    execute if score @s Vlg.General.Timer.Sub matches 10.. as @e[type=text_display,tag=Other.Text.Tutorial] run data modify entity @s text set value '{"text":"↓","color":"white"}'
    execute if score @s Vlg.General.Timer.Sub matches 20.. as @e[type=text_display,tag=Other.Text.Tutorial] run data modify entity @s text set value '{"text":"↓","color":"red"}'
    execute if score @s Vlg.General.Timer.Sub matches 20.. run scoreboard players set @s Vlg.General.Timer.Sub 0

# 終了
    execute if score @s Vlg.General.Counter matches 11.. run kill @e[type=text_display,tag=Other.Text.Tutorial]
    execute if score @s Vlg.General.Counter matches 11.. run kill @s
