#> mhdp_core:phase/1_village/villager/tutorial/06_quest_accept
#
# tick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# チュートリアル表示
    execute if score @s Vlg.General.Timer matches 10 run kill @e[type=text_display,tag=Other.Text.Tutorial]
    # execute if score @s Vlg.General.Timer matches 10 run summon text_display 239 66 198 {Tags:["Other.Text.Tutorial"],default_background:0b,brightness:{sky:15,block:15},text:'{"text":"↓","color":"red"}',transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[12f,12f,12f]},background:16777215,text_opacity:255,billboard:"vertical",alignment:"center",Glowing:1b,see_through:1b}
    execute if score @s Vlg.General.Timer matches 10 as @a[tag=!Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Vlg.General.Timer matches 10 run tellraw @a[tag=!Ply.State.PlayingQuest] [\
        {"text":"\n【 チュートリアル：クエスト受注 ","color":"#00FFC3","bold": true},{"text":"2/3","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  この本で、 ","color": "#00FFC3","bold": false},{"text":"クエストの受注","color": "#ff9900","bold": true},{"text":" ができます。\n","color": "#00FFC3","bold": false},\
        {"text":"  クエスト出発のためには、必ずクエストを受注する必要があります。\n","color": "#00FFC3","bold": false},\
        {"text":"  受注したいクエストのページを開き、","color": "#00FFC3","bold": false},{"text":"[受注]","color": "#ff9900","bold": true},{"text":" をクリックすると、\n","color": "#00FFC3","bold": false},\
        {"text":"  クエストを受注することができます。\n","color": "#00FFC3","bold": false},\
        {"text":"  クエストを受注した人の頭上には、\n","color": "#00FFC3","bold": false},\
        {"text":"  チケットマーク ","color": "#00FFC3","bold": false},{"text":"a","font":"icons/mhdp_icons","color": "white","bold": false},{"text":" が表示されます。\n","color": "#00FFC3","bold": false}\
    ]

    execute if score @s Vlg.General.Timer matches 210 as @a[tag=!Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Vlg.General.Timer matches 210 run tellraw @a[tag=!Ply.State.PlayingQuest] [\
        {"text":"\n【 チュートリアル：クエスト受注 ","color":"#00FFC3","bold": true},{"text":"3/3","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  プレイしたことのないクエストには ","color": "#00FFC3","bold": false},{"text":"(NEW)","color": "#ff9900","bold": true},{"text":" マーク、\n","color": "#00FFC3","bold": false},\
        {"text":"  クリア済のクエストには ","color": "#00FFC3","bold": false},{"text":"(CLEAR)","color": "#ff9900","bold": true},{"text":" マークが表示されます。\n","color": "#00FFC3","bold": false},\
        {"text":"  初めはチュートリアルクエストしか受注できませんが、\n","color": "#00FFC3","bold": false},\
        {"text":"  受注できるクエストの数は ","color": "#00FFC3","bold": false},{"text":"クエストをクリアする","color": "#ff9900","bold": true},{"text":" ことで増加します。\n","color": "#00FFC3","bold": false},\
        {"text":"  ぜひ、すべてのクエストのクリアを目指してみてください。\n","color": "#00FFC3","bold": false}\
    ]

# 遷移：一定時間後
    execute if score @s Vlg.General.Timer matches 400.. run function mhdp_core:phase/1_village/villager/tutorial/change_phase