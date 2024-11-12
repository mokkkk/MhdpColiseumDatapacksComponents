#> mhdp_core:beta/phase/1_village/tutorial/review/01_bc
#
# ベータ版処理 チュートリアル再生
#
# @within function mhdp_core:phase/1_village/change_phase/check

# 1
    execute if score @s Ply.Ope.TutorialTrigger matches 10 run \
    tellraw @a[tag=!Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n【 チュートリアル：画面表示・斬れ味 ","color":"#00FFC3","bold": true},{"text":"1/2","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  "},{"text":"3","color": "white","font":"ui/sharpness"},\
        {"text":"\n  これは "},{"text":"斬れ味ゲージ","color": "#ff9900","bold": true},{"text":" です。\n"},\
        {"text":"  弓以外の武器を持っている場合、表示されます。\n"},\
        {"text":"\n  "},\
        {"text":"l","clickEvent":{"action":"run_command","value":"/return 0"},"color": "#7a7a7a","font":"icons/book"},{"text":"                                                            "},\
        {"text":"r","clickEvent":{"action":"run_command","value":"/trigger Ply.Ope.TutorialTrigger set 11"},"color": "#ff7300","font":"icons/book"},\
        {"text":"\n"}\
    ]

    execute if score @s Ply.Ope.TutorialTrigger matches 11 run \
    tellraw @a[tag=!Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n【 チュートリアル：画面表示・斬れ味 ","color":"#00FFC3","bold": true},{"text":"2/2","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  モンスターに攻撃をする際、斬れ味を消費します。\n"},\
        {"text":"  武器の斬れ味が下がると、"},{"text":" 黄 ","color": "yellow","bold": true},{"text":"橙 ","color": "#FF8000","bold": true},{"text":"赤 ","color": "red","bold": true},{"text":"…のように、色が変わっていきます。\n"},\
        {"text":"  斬れ味が悪いと、"},{"text":"モンスターへのダメージが大きく減少します","color": "#ff9900","bold": true},{"text":"。\n"},\
        {"text":"  研石を使うと、斬れ味を回復することができます。\n"},\
        {"text":"  隙を見て砥石を使い、高い斬れ味を保ちましょう。\n"},\
        {"text":"\n  "},\
        {"text":"l","clickEvent":{"action":"run_command","value":"/trigger Ply.Ope.TutorialTrigger set 10"},"color": "#ff7300","font":"icons/book"},{"text":"                                                            "},\
        {"text":"r","clickEvent":{"action":"run_command","value":"/return 0"},"color": "#7a7a7a","font":"icons/book"},\
        {"text":"\n"}\
    ]
