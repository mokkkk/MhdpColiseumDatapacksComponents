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

    execute if score @s Vlg.General.Timer matches 260 as @a[tag=!Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Vlg.General.Timer matches 260 run tellraw @a[tag=!Ply.State.PlayingQuest] [\
        {"text":"\n【 チュートリアル：注意事項 ","color":"#00FFC3","bold": true},{"text":"1/4","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  本マップをプレイするうえで、必須設定は以下の通りです。\n","color": "#00FFC3","bold": false},\
        {"text":"  ・ビデオ設定 > 演算距離は 12チャンク以上 にすること\n","color": "#ff9900","bold": true},\
        {"text":"    マルチプレイの場合、server.propertiesに以下の設定を書く\n","color": "#ff9900","bold": true},\
        {"text":"       - simulation-distance=12\n","color": "#ff9900","bold": true},\
        {"text":"  ・言語設定 > フォント設定から、\n","color": "#ff9900","bold": true},\
        {"text":"    Unicodeフォントを強制する を オフ に設定すること\n","color": "#ff9900","bold": true},\
        {"text":"  ・専用リソースパックを適用すること\n","color": "#ff9900","bold": true}\
    ]

    execute if score @s Vlg.General.Timer matches 560 as @a[tag=!Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Vlg.General.Timer matches 560 run tellraw @a[tag=!Ply.State.PlayingQuest] [\
        {"text":"\n【 チュートリアル：注意事項 ","color":"#00FFC3","bold": true},{"text":"2/4","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  必須設定を守らなかった場合、\n","color": "#00FFC3","bold": false},\
        {"text":"  正常にゲームをプレイできない可能性があります。\n","color": "#00FFC3","bold": false},\
        {"text":"  必須設定は必ず守ってください。\n","color": "#ff9900","bold": true}\
    ]

    execute if score @s Vlg.General.Timer matches 760 as @a[tag=!Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Vlg.General.Timer matches 760 run tellraw @a[tag=!Ply.State.PlayingQuest] [\
        {"text":"\n【 チュートリアル：注意事項 ","color":"#00FFC3","bold": true},{"text":"3/4","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  本マップでの推奨設定は以下の通りです。\n","color": "#00FFC3","bold": false},\
        {"text":"  ・ビデオ設定 > 描画距離は 12チャンク以上 にすること\n","color": "#ff9900","bold": true},\
        {"text":"  ・ビデオ設定 > パーティクルの表示は すべて にすること\n","color": "#ff9900","bold": true},\
        {"text":"  ・ビデオ設定 > 視野の変化は オフ にすること\n","color": "#ff9900","bold": true},\
        {"text":"  ・サウンド設定 > 主音量をうるさくない程度に調整すること\n","color": "#ff9900","bold": true},\
        {"text":"  ・できれば一人称視点でプレイすること\n","color": "#ff9900","bold": true}\
    ]

    execute if score @s Vlg.General.Timer matches 1060 as @a[tag=!Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Vlg.General.Timer matches 1060 run tellraw @a[tag=!Ply.State.PlayingQuest] [\
        {"text":"\n【 チュートリアル：注意事項 ","color":"#00FFC3","bold": true},{"text":"4/4","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  推奨設定を守ることで、ゲームをより楽しめるようになります。\n","color": "#00FFC3","bold": false},\
        {"text":"  特に、視野の変化をオフにすることを推奨します。\n","color": "#ff9900","bold": true}\
    ]

# 遷移：一定時間後
    execute if score @s Vlg.General.Timer matches 1260.. run function mhdp_core:phase/1_village/villager/tutorial/change_phase
