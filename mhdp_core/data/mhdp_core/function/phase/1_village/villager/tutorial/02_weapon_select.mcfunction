#> mhdp_core:phase/1_village/villager/tutorial/02_weapon_select
#
# tick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# チュートリアル表示
    execute if score @s Vlg.General.Timer matches 10 run kill @e[type=text_display,tag=Other.Text.Tutorial]
    # execute if score @s Vlg.General.Timer matches 60 run summon text_display 239 66 198 {Tags:["Other.Text.Tutorial"],default_background:0b,brightness:{sky:15,block:15},text:'{"text":"↓","color":"red"}',transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[12f,12f,12f]},background:16777215,text_opacity:255,billboard:"vertical",alignment:"center",Glowing:1b,see_through:1b}
    execute if score @s Vlg.General.Timer matches 10 as @a[tag=!Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Vlg.General.Timer matches 10 run tellraw @a[tag=!Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n【 チュートリアル：武器の装備 ","color":"#00FFC3","bold": true},{"text":"2/2","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  使いたい武器を "},{"text":"右クリック","color": "#ff9900","bold": true},{"text":" で、選択できます。\n"},\
        {"text":"  武器は、クエスト出発時に自動で装備されます。\n"},\
        {"text":"  武器ごとの特徴は書見台の本に書かれているので、参考にしてください。\n"},\
        {"text":"  "},{"text":"地ノ型","color": "#ff9900","bold": true},{"text":" は、武器の操作スタイルです。\n"},\
        {"text":"  チュートリアルクエストクリア後、"},{"text":"天ノ型","color": "#ff9900","bold": true},{"text":" が追加されます。\n"}\
    ]
    

# 遷移：一定時間後
    execute if score @s Vlg.General.Timer matches 300.. run function mhdp_core:phase/1_village/villager/tutorial/change_phase
