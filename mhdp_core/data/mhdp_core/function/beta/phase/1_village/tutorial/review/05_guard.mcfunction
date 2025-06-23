#> mhdp_core:beta/phase/1_village/tutorial/review/05_guard
#
# ベータ版処理 チュートリアル再生
#
# @within function mhdp_core:phase/1_village/change_phase/check

# 1
    execute if score @s Ply.Ope.TutorialTrigger matches 40 run \
    tellraw @a[tag=!Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n【 チュートリアル：ガード ","color":"#00FFC3","bold": true},{"text":"1/2","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  片手剣や大剣など、一部の武器は "},{"text":"ガード","color": "#ff9900","bold": true},{"text": " ができます。\n"},\
        {"text":"  抜刀中に "},{"text":"スニーク","color": "#ff9900","bold": true},{"text": " すると、武器や盾を構えてガードの姿勢を取ります。\n"},\
        {"text":"  または、納刀中にホットバーの空欄を選択しながらスニークすると、\n"},\
        {"text":"  抜刀すると同時にガードすることができます。\n"},\
        {"text":"\n  "},\
        {"text":"l","click_event":{"action":"run_command","command":"/return 0"},"color": "#7a7a7a","font":"icons/book"},{"text":"                                                            "},\
        {"text":"r","click_event":{"action":"run_command","command":"/trigger Ply.Ope.TutorialTrigger set 41"},"color": "#ff7300","font":"icons/book"},\
        {"text":"\n"}\
    ]

    execute if score @s Ply.Ope.TutorialTrigger matches 41 run \
    tellraw @a[tag=!Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n【 チュートリアル：ガード ","color":"#00FFC3","bold": true},{"text":"2/2","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  ガード中に攻撃を受けると、 "},{"text":"スタミナや斬れ味を消費して\n","color": "#ff9900","bold": true},\
        {"text":"  受けるダメージを軽減します。\n"},\
        {"text":"  "},{"text":"完全にダメージを無効化することはできない","color": "#ff9900","bold": true},{"text": " ので注意してください。\n"},\
        {"text":"  なお、スタミナが足りない場合、ガードは失敗します。\n"},\
        {"text":"\n  "},\
        {"text":"l","click_event":{"action":"run_command","command":"/trigger Ply.Ope.TutorialTrigger set 40"},"color": "#ff7300","font":"icons/book"},{"text":"                                                            "},\
        {"text":"r","click_event":{"action":"run_command","command":"/return 0"},"color": "#7a7a7a","font":"icons/book"},\
        {"text":"\n"}\
    ]
