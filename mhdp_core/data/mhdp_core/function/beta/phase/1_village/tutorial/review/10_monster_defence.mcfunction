#> mhdp_core:beta/phase/1_village/tutorial/review/10_monster_defence
#
# ベータ版処理 チュートリアル再生
#
# @within function mhdp_core:phase/1_village/change_phase/check

# 1
    execute if score @s Ply.Ope.TutorialTrigger matches 90 run \
    tellraw @a[tag=!Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n【 チュートリアル：部位 ","color":"#00FFC3","bold": true},{"text":"1/3","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  モンスターには、"},{"text":"部位","color": "#ff9900","bold": true},{"text": " が存在します。\n"},\
        {"text":"  部位によって "},{"text":"有効な属性や攻撃種別が異なります","color": "#ff9900","bold": true},{"text": " 。\n"},\
        {"text":"  モンスター毎に有効な部位は異なり、\n"},\
        {"text":"  有効部位への攻撃はダメージが "},{"text":"オレンジ色","color": "#ff9900","bold": true},{"text": " で表示されます。\n"},\
        {"text":"\n  "},\
        {"text":"l","clickEvent":{"action":"run_command","value":"/return 0"},"color": "#7a7a7a","font":"icons/book"},{"text":"                                                            "},\
        {"text":"r","clickEvent":{"action":"run_command","value":"/trigger Ply.Ope.TutorialTrigger set 91"},"color": "#ff7300","font":"icons/book"},\
        {"text":"\n"}\
    ]

    execute if score @s Ply.Ope.TutorialTrigger matches 91 run \
    tellraw @a[tag=!Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n【 チュートリアル：部位 ","color":"#00FFC3","bold": true},{"text":"2/3","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  同じ部位に攻撃し続けると、モンスターが "},{"text":"怯み、隙が生じます","color": "#ff9900","bold": true},{"text": " 。\n"},\
        {"text":"  部位によっては "},{"text":"部位破壊","color": "#ff9900","bold": true},{"text": " が発生します。\n"},\
        {"text":"  部位破壊すると、貰える報酬が増えたり、\n  モンスターの攻撃が弱体化することがあります。\n"},\
        {"text":"\n  "},\
        {"text":"l","clickEvent":{"action":"run_command","value":"/trigger Ply.Ope.TutorialTrigger set 90"},"color": "#ff7300","font":"icons/book"},{"text":"                                                            "},\
        {"text":"r","clickEvent":{"action":"run_command","value":"/trigger Ply.Ope.TutorialTrigger set 92"},"color": "#ff7300","font":"icons/book"},\
        {"text":"\n"}\
    ]

    execute if score @s Ply.Ope.TutorialTrigger matches 92 run \
    tellraw @a[tag=!Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n【 チュートリアル：部位 ","color":"#00FFC3","bold": true},{"text":"3/3","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  怯みの動作は、部位によって異なります。\n"},\
        {"text":"  例えば、足に攻撃し続けると "},{"text":"モンスターが転倒する","color": "#ff9900","bold": true},{"text": " ことがあります。\n"},\
        {"text":"  モンスターによって有効な部位は異なるので、\n  戦う相手によって狙う部位を変えましょう。\n"},\
        {"text":"\n  "},\
        {"text":"l","clickEvent":{"action":"run_command","value":"/trigger Ply.Ope.TutorialTrigger set 91"},"color": "#ff7300","font":"icons/book"},{"text":"                                                            "},\
        {"text":"r","clickEvent":{"action":"run_command","value":"/return 0"},"color": "#7a7a7a","font":"icons/book"},\
        {"text":"\n"}\
    ]
