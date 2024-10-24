#> mhdp_core:phase/1_village/villager/tutorial/00_greeting
#
# tick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# チュートリアル表示
    execute if score @s Vlg.General.Timer matches 60 as @a[tag=!Ply.State.PlayingQuest] at @s run playsound entity.player.levelup master @s ~ ~ ~ 2 0.5
    execute if score @s Vlg.General.Timer matches 60 run tellraw @a[tag=!Ply.State.PlayingQuest] [\
        {"text":"\n【 チュートリアル：大闘技場 ","color":"#00FFC3","bold": true},{"text":"1/1","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  配布マップ 大闘技場へようこそ。\n","color": "#ff9900","bold": true},\
        {"text":"  このチュートリアルでは、武器の選び方や\n","color": "#00FFC3","bold": false},\
        {"text":"  クエストの開始方法について説明します。\n","color": "#00FFC3","bold": false}\
    ]

# 遷移：一定時間後
    execute if score @s Vlg.General.Timer matches 260.. run function mhdp_core:phase/1_village/villager/tutorial/change_phase
