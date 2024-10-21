#> mhdp_core:phase/1_village/villager/tutorial/1_weapon/main
#
# 村のtick処理
#
# @within function mhdp_core:tick

# チュートリアル表示
    kill @e[type=text_display,tag=Other.Text.Tutorial]
    summon text_display 239 66 198 {Tags:["Other.Text.Tutorial"],default_background:0b,brightness:{sky:15,block:15},text:'{"text":"↓","color":"red"}',transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[12f,12f,12f]},background:16777215,text_opacity:255,billboard:"vertical",alignment:"center",Glowing:1b,see_through:1b}
    execute as @a[tag=!Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    tellraw @a[tag=!Ply.State.PlayingQuest] [\
        {"text":"\n【 チュートリアル：武器の装備 ","color":"#00FFC3","bold": true},{"text":"1/1","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  初めてのプレイヤーは、まずこの箇所で武器を装備しましょう。\n","color": "#00FFC3","bold": false},\
        {"text":"  右クリックで武器を選択できます。\n","color": "#00FFC3","bold": false},\
        {"text":"  武器の特徴については、置いてある本を参照してください。\n","color": "#00FFC3","bold": false}\
    ]
