#> mhdp_core:phase/1_village/villager/tutorial/0_greeting/main
#
# 村のtick処理
#
# @within function mhdp_core:tick

# チュートリアル表示
    execute as @a[tag=!Ply.State.PlayingQuest] at @s run playsound entity.player.levelup master @s ~ ~ ~ 2 0.5
    tellraw @a[tag=!Ply.State.PlayingQuest] [\
        {"text":"\n【 チュートリアル：大闘技場 ","color":"#00FFC3","bold": true},{"text":"1/1","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  配布マップ 大闘技場へようこそ。\n","color": "#00FFC3","bold": false},\
        {"text":"  このチュートリアルでは、武器の選び方や\n","color": "#00FFC3","bold": false},\
        {"text":"  クエストの開始方法について説明します。\n","color": "#00FFC3","bold": false}\
    ]
