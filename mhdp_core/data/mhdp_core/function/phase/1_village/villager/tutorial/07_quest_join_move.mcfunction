#> mhdp_core:phase/1_village/villager/tutorial/07_quest_join_move
#
# tick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# チュートリアル表示
    execute if score @s Vlg.General.Timer matches 10 run kill @e[type=text_display,tag=Other.Text.Tutorial]
    execute if score @s Vlg.General.Timer matches 10 run summon text_display 226 66 200 {Tags:["Other.Text.Tutorial"],default_background:0b,brightness:{sky:15,block:15},text:'{"text":"↓","color":"red"}',transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[12f,12f,12f]},background:16777215,text_opacity:255,billboard:"vertical",alignment:"center",Glowing:1b,see_through:1b}
    execute if score @s Vlg.General.Timer matches 10 as @a[tag=!Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Vlg.General.Timer matches 10 run tellraw @a[tag=!Ply.State.PlayingQuest] [\
        {"text":"\n【 チュートリアル：クエスト参加(マルチプレイ) ","color":"#00FFC3","bold": true},{"text":"1/2","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  次に、マルチプレイ時のクエスト参加方法を説明します。\n","color": "#00FFC3","bold": false},\
        {"text":"  上空で点滅する ","color": "#00FFC3","bold": false},{"text":"↓","color": "#ff9900","bold": true},{"text":" マークを見つけて、","color": "#00FFC3","bold": false},\
        {"text":"  そこまで移動してください。\n","color": "#00FFC3","bold": false}\
    ]

# 遷移：移動後
    execute if score @s Vlg.General.Timer matches 100.. positioned 226 62 200 if entity @a[tag=!Ply.State.PlayingQuest,distance=..5] run function mhdp_core:phase/1_village/villager/tutorial/change_phase