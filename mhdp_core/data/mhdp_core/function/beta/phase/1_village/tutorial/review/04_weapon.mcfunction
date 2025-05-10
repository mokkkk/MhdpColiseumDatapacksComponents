#> mhdp_core:beta/phase/1_village/tutorial/review/04_weapon
#
# ベータ版処理 チュートリアル再生
#
# @within function mhdp_core:phase/1_village/change_phase/check

# 1
    execute if score @s Ply.Ope.TutorialTrigger matches 30 run \
    tellraw @a[tag=!Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n【 チュートリアル：武器の操作 基本編 ","color":"#00FFC3","bold": true},{"text":"1/3","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  ホットバーで、空欄のアイテムを選択した状態で "},{"keybind":"key.swapOffhand","color": "#ff9900","bold": true},{"text":"キー","color": "#ff9900","bold": true},{"text":" を押すと、\n"},\
        {"text":"  武器の抜刀ができます。\n"},\
        {"text":"\n  "},\
        {"text":"l","click_event":{"action":"run_command","command":"/return 0"},"color": "#7a7a7a","font":"icons/book"},{"text":"                                                            "},\
        {"text":"r","click_event":{"action":"run_command","command":"/trigger Ply.Ope.TutorialTrigger set 31"},"color": "#ff7300","font":"icons/book"},\
        {"text":"\n"}\
    ]

    execute if score @s Ply.Ope.TutorialTrigger matches 31 run \
    tellraw @a[tag=!Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n【 チュートリアル：武器の操作 基本編 ","color":"#00FFC3","bold": true},{"text":"2/3","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  抜刀中に "},{"keybind":"key.swapOffhand","color": "#ff9900","bold": true},{"text":"キー","color": "#ff9900","bold": true},{"text":" を押すか、\n"},\
        {"text":"  "},{"text":"マウスホイール","color": "#ff9900","bold": true},{"text":" などで別のアイテムを選択することで、\n"},\
        {"text":"  武器を納刀します。\n"},\
        {"text":"\n  "},\
        {"text":"l","click_event":{"action":"run_command","command":"/trigger Ply.Ope.TutorialTrigger set 30"},"color": "#ff7300","font":"icons/book"},{"text":"                                                            "},\
        {"text":"r","click_event":{"action":"run_command","command":"/trigger Ply.Ope.TutorialTrigger set 32"},"color": "#ff7300","font":"icons/book"},\
        {"text":"\n"}\
    ]

    execute if score @s Ply.Ope.TutorialTrigger matches 32 run \
    tellraw @a[tag=!Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n【 チュートリアル：武器の操作 基本編 ","color":"#00FFC3","bold": true},{"text":"3/3","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  また、ホットバーで空欄を選択した状態で "},{"text":"マウス","color": "#ff9900","bold": true},{"keybind":"key.use","color": "#ff9900","bold": true},{"text":" を押すと、\n"},\
        {"text":"  "},{"text":"抜刀攻撃","color": "#ff9900","bold": true},{"text":" ができます。\n"},\
        {"text":"  抜刀しながら、即座に攻撃することができます。\n"},\
        {"text":"\n  "},\
        {"text":"l","click_event":{"action":"run_command","command":"/trigger Ply.Ope.TutorialTrigger set 31"},"color": "#ff7300","font":"icons/book"},{"text":"                                                            "},\
        {"text":"r","click_event":{"action":"run_command","command":"/trigger Ply.Ope.TutorialTrigger set 33"},"color": "#ff7300","font":"icons/book"},\
        {"text":"\n"}\
    ]

    execute if score @s Ply.Ope.TutorialTrigger matches 33 run \
    tellraw @a[tag=!Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n【 チュートリアル：武器の操作 攻撃 ","color":"#00FFC3","bold": true},{"text":"1/1","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  抜刀中に "},{"text":"マウス","color": "#ff9900","bold": true},{"keybind":"key.use","color": "#ff9900","bold": true},{"text":" を押すか、\n"},\
        {"text":"  モンスターに近づいて "},{"text":"マウス","color": "#ff9900","bold": true},{"keybind":"key.attack","color": "#ff9900","bold": true},{"text":" で攻撃ができます。\n"},\
        {"text":"  武器の詳しい操作方法は、訓練で確かめてください。\n"},\
        {"text":"\n  "},\
        {"text":"l","click_event":{"action":"run_command","command":"/trigger Ply.Ope.TutorialTrigger set 32"},"color": "#ff7300","font":"icons/book"},{"text":"                                                            "},\
        {"text":"r","click_event":{"action":"run_command","command":"/return 0"},"color": "#7a7a7a","font":"icons/book"},\
        {"text":"\n"}\
    ]
