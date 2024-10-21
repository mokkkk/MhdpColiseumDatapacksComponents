#> mhdp_core:phase/1_village/villager/tutorial/5_quest_start/main
#
# 村のtick処理
#
# @within function mhdp_core:tick

# チュートリアル表示
    kill @e[type=text_display,tag=Other.Text.Tutorial]
    summon text_display 223 65 206 {Tags:["Other.Text.Tutorial"],default_background:0b,brightness:{sky:15,block:15},text:'{"text":"↓","color":"red"}',transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[12f,12f,12f]},background:16777215,text_opacity:255,billboard:"vertical",alignment:"center",Glowing:1b,see_through:1b}
    execute as @a[tag=!Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    tellraw @a[tag=!Ply.State.PlayingQuest] [\
        {"text":"\n【 チュートリアル：クエスト出発 ","color":"#00FFC3","bold": true},{"text":"1/1","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  このベルを鳴らすと、クエストを開始します。\n","color": "#00FFC3","bold": false},\
        {"text":"  クエスト参加者全員が武器を選択していないと出発できないので、\n  注意してください。\n","color": "#00FFC3","bold": false},\
        {"text":"  村でのチュートリアルは、以上で終了です。\n","color": "#ff9900","bold": true}\
    ]
