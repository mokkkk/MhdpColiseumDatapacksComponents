#> mhdp_core:phase/1_village/villager/tutorial/10_quest_start
#
# tick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# チュートリアル表示
    execute if score @s Vlg.General.Timer matches 10 run kill @e[type=text_display,tag=Other.Text.Tutorial]
    # execute if score @s Vlg.General.Timer matches 10 run summon text_display 239 66 198 {Tags:["Other.Text.Tutorial"],default_background:0b,brightness:{sky:15,block:15},text:'{"text":"↓","color":"red"}',transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[12f,12f,12f]},background:16777215,text_opacity:255,billboard:"vertical",alignment:"center",Glowing:1b,see_through:1b}
    execute if score @s Vlg.General.Timer matches 10 as @a[tag=!Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Vlg.General.Timer matches 10 run tellraw @a[tag=!Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n【 チュートリアル：クエスト出発 ","color":"#00FFC3","bold": true},{"text":"2/2","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  このベルを鳴らすと、 "},{"text":"クエストに出発","color": "#ff9900","bold": true},{"text":" します。\n"},\
        {"text":"  "},{"text":"クエスト受注者と参加者全員が","color": "#ff9900","bold": true},{"text":" フィールドに移動します。\n"},\
        {"text":"  クエスト出発条件を満たしていない場合、警告が表示されるので、\n"},\
        {"text":"  その警告に従ってください。\n"},\
        {"text":"  本マップの基本的な遊び方についての説明は以上です。\n"}\
    ]

# 遷移：一定時間後
    execute if score @s Vlg.General.Timer matches 200.. run function mhdp_core:phase/1_village/villager/tutorial/change_phase
