#> mhdp_core:phase/1_village/villager/tutorial/04_training
#
# tick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# チュートリアル表示
    execute if score @s Vlg.General.Timer matches 10 run kill @e[type=text_display,tag=Other.Text.Tutorial]
    execute if score @s Vlg.General.Timer matches 10 as @a[tag=!Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Vlg.General.Timer matches 10 run tellraw @a[tag=!Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n【 チュートリアル：訓練所 ","color":"#00FFC3","bold": true},{"text":"2/3","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  ここから "},{"text":"訓練を開始","color": "#ff9900","bold": true},{"text":" できます。\n"},\
        {"text":"  訓練中は、武器や特殊装具の練習ができます。\n"},\
        {"text":"  武器の基本操作は "},{"text":"チュートリアルクエストで学べる","color": "#ff9900","bold": true},{"text":" ので、\n"},\
        {"text":"  チュートリアルプレイ後に利用するのをおすすめします。\n"}\
    ]

    execute if score @s Vlg.General.Timer matches 180 run kill @e[type=text_display,tag=Other.Text.Tutorial]
    execute if score @s Vlg.General.Timer matches 180 run summon text_display -112 72 795 {Tags:["Other.Text.Tutorial"],default_background:0b,brightness:{sky:15,block:15},text:'{"text":"↓","color":"red"}',transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[12f,12f,12f]},background:16777215,text_opacity:255,billboard:"vertical",alignment:"center",Glowing:1b,see_through:1b}
    execute if score @s Vlg.General.Timer matches 180 as @a[tag=!Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Vlg.General.Timer matches 180 run tellraw @a[tag=!Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n【 チュートリアル：訓練所 ","color":"#00FFC3","bold": true},{"text":"3/3","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  訓練中は "},{"text":" 武器操作方法などのチュートリアル ","color": "#ff9900","bold": true},{"text":" を受けられます。\n"},\
        {"text":"  "},{"text":"↓","color": "#ff9900","bold": true},{"text":" マークの位置にある本からチュートリアルを開始できるので、\n"},\
        {"text":"  武器について学びたいときに利用してください。\n"}\
    ]

# 遷移：一定時間後
    execute if score @s Vlg.General.Timer matches 350.. run function mhdp_core:phase/1_village/villager/tutorial/change_phase
