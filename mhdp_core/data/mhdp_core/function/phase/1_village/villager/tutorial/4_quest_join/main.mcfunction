#> mhdp_core:phase/1_village/villager/tutorial/4_quest_join/main
#
# 村のtick処理
#
# @within function mhdp_core:tick

# チュートリアル表示
    kill @e[type=text_display,tag=Other.Text.Tutorial]
    summon text_display 226 66 200 {Tags:["Other.Text.Tutorial"],default_background:0b,brightness:{sky:15,block:15},text:'{"text":"↓","color":"red"}',transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[12f,12f,12f]},background:16777215,text_opacity:255,billboard:"vertical",alignment:"center",Glowing:1b,see_through:1b}
    execute as @a[tag=!Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    tellraw @a[tag=!Ply.State.PlayingQuest] [\
        {"text":"\n【 チュートリアル：クエストへの参加 ","color":"#00FFC3","bold": true},{"text":"1/1","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  マルチプレイの場合、このボードを右クリックすると、\n","color": "#00FFC3","bold": false},\
        {"text":"  受注されているクエストに参加することができます。\n","color": "#00FFC3","bold": false},\
        {"text":"  クエストに参加した人の頭上には、\n","color": "#00FFC3","bold": false},\
        {"text":"  半券マーク ","color": "#00FFC3","bold": false},{"text":"b","font":"icons/mhdp_icons","color": "white","bold": false},{"text":" が表示されます。\n","color": "#00FFC3","bold": false}\
    ]
