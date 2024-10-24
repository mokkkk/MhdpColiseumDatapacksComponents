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
        {"text":"\n【 チュートリアル：クエスト参加(マルチプレイ) ","color":"#00FFC3","bold": true},{"text":"2/2","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  このボードを右クリックすると、 ","color": "#00FFC3","bold": false},{"text":"クエストに参加","color": "#ff9900","bold": true},{"text":" することができます。\n","color": "#00FFC3","bold": false},\
        {"text":"  マルチプレイの場合、クエストに参加しなかったプレイヤーは","color": "#00FFC3","bold": false},\
        {"text":"  フィールドに移動できませんので注意してください。\n","color": "#00FFC3","bold": false},\
        {"text":"  クエストに参加したプレイヤーの頭上には、\n","color": "#00FFC3","bold": false},\
        {"text":"  半券マーク","color": "#00FFC3","bold": false},{"text":"b","font":"icons/mhdp_icons","color": "white","bold": false},{"text":" が表示されます。\n","color": "#00FFC3","bold": false}\
    ]

# 遷移：一定時間後
    execute if score @s Vlg.General.Timer matches 250.. run function mhdp_core:phase/1_village/villager/tutorial/change_phase
