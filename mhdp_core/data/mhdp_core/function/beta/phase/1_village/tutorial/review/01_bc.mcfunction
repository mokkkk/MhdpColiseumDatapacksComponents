#> mhdp_core:beta/phase/1_village/tutorial/review/01_bc
#
# ベータ版処理 チュートリアル再生
#
# @within function mhdp_core:phase/1_village/change_phase/check

# 1
    execute if score @s Ply.Ope.TutorialTrigger matches 1 run \
    tellraw @a[tag=!Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n【 チュートリアル：ベースキャンプ ","color":"#00FFC3","bold": true},{"text":"1/2","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  クエストを開始すると "},{"text":"ベースキャンプ","color": "#ff9900","bold": true},{"text":" に移動します。\n"},\
        {"text":"  クエスト開始直後、ベースキャンプからフィールドに移動するまでは\n"},\
        {"text":"  時間が経過しません","color": "#ff9900","bold": true},{"text":"。\n"},\
        {"text":"  アイテムを整理し、狩りの準備を整えましょう。\n"},\
        {"text":"\n  "},\
        {"text":"l","clickEvent":{"action":"run_command","value":"/return 0"},"color": "#7a7a7a","font":"icons/book"},{"text":"                                                            "},\
        {"text":"r","clickEvent":{"action":"run_command","value":"/trigger Ply.Ope.TutorialTrigger set 2"},"color": "#ff7300","font":"icons/book"},\
        {"text":"\n"}\
    ]

# 2
    execute if score @s Ply.Ope.TutorialTrigger matches 2 run \
    tellraw @a[tag=!Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n【 チュートリアル：ベースキャンプ ","color":"#00FFC3","bold": true},{"text":"2/2","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  先にある洞窟に進むと、モンスターのいるフィールドに移動します。\n"},\
        {"text":"  武器を使うためには、ホットバーに空きスロットが必要です。\n"},\
        {"text":"  1つ以上の空きスロットを作ってから移動することをおすすめします","color": "#ff9900","bold": true},{"text":"。\n"},\
        {"text":"\n  "},\
        {"text":"l","clickEvent":{"action":"run_command","value":"/trigger Ply.Ope.TutorialTrigger set 1"},"color": "#ff7300","font":"icons/book"},{"text":"                                                            "},\
        {"text":"r","clickEvent":{"action":"run_command","value":"/return 0"},"color": "#7a7a7a","font":"icons/book"},\
        {"text":"\n"}\
    ]
