#> mhdp_core:beta/phase/1_village/tutorial/review/01_bc
#
# ベータ版処理 チュートリアル再生
#
# @within function mhdp_core:phase/1_village/change_phase/check

# 1
    execute if score @s Ply.Ope.TutorialTrigger matches 20 run \
    tellraw @a[tag=!Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n【 チュートリアル：画面表示・スタミナ ","color":"#00FFC3","bold": true},{"text":"1/2","color":"#00FFC3","bold": false},{"text":" 】\n","color":"#00FFC3","bold": true},\
        {"text":"  ","bold": false},\
        {"text":"#","font":"ui/tutorial/stamina","color":"white","bold": false},\
        {"text": "\uF801","font": "space","bold": false},\
        {"text":"#","font":"ui/tutorial/stamina","color":"white","bold": false},\
        {"text": "\uF801","font": "space","bold": false},\
        {"text":"#","font":"ui/tutorial/stamina","color":"white","bold": false},\
        {"text": "\uF801","font": "space","bold": false},\
        {"text":"#","font":"ui/tutorial/stamina","color":"white","bold": false},\
        {"text": "\uF801","font": "space","bold": false},\
        {"text":"#","font":"ui/tutorial/stamina","color":"white","bold": false},\
        {"text": "\uF801","font": "space","bold": false},\
        {"text":"#","font":"ui/tutorial/stamina","color":"white","bold": false},\
        {"text": "\uF801","font": "space","bold": false},\
        {"text":"#","font":"ui/tutorial/stamina","color":"white","bold": false},\
        {"text": "\uF801","font": "space","bold": false},\
        {"text":"#","font":"ui/tutorial/stamina","color":"white","bold": false},\
        {"text": "\uF801","font": "space","bold": false},\
        {"text": "\uF801","font": "space","bold": false},{"text":"\uF813\uF801","font": "space","bold": false},{"text":"_","font":"ui/tutorial/stamina","color":"white","bold": false},\
        {"text":"\n\n  これは "},{"text":"スタミナゲージ","color": "#ff9900","bold": true},{"text":" です。\n"},\
        {"text":"\n  "},\
        {"text":"l","clickEvent":{"action":"run_command","value":"/return 0"},"color": "#7a7a7a","font":"icons/book"},{"text":"                                                            "},\
        {"text":"r","clickEvent":{"action":"run_command","value":"/trigger Ply.Ope.TutorialTrigger set 21"},"color": "#ff7300","font":"icons/book"},\
        {"text":"\n"}\
    ]

    execute if score @s Ply.Ope.TutorialTrigger matches 21 run \
    tellraw @a[tag=!Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n【 チュートリアル：画面表示・スタミナ ","color":"#00FFC3","bold": true},{"text":"2/2","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  ジャンプやダッシュなどの行動をとると、スタミナを消費します。\n"},\
        {"text":"  スタミナが尽きると、"},{"text":"ジャンプおよびダッシュができなくなります","color": "#ff9900","bold": true},{"text":"。\n"},\
        {"text":"  スタミナは時間で自然に回復します。\n"},\
        {"text":"  スタミナが減ったら攻撃の手を止め、回復に専念しましょう。\n"},\
        {"text":"\n  "},\
        {"text":"l","clickEvent":{"action":"run_command","value":"/trigger Ply.Ope.TutorialTrigger set 20"},"color": "#ff7300","font":"icons/book"},{"text":"                                                            "},\
        {"text":"r","clickEvent":{"action":"run_command","value":"/return 0"},"color": "#7a7a7a","font":"icons/book"},\
        {"text":"\n"}\
    ]
