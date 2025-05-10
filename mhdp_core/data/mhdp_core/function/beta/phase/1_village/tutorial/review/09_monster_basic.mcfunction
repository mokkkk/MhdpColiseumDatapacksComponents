#> mhdp_core:beta/phase/1_village/tutorial/review/09_monster_basic
#
# ベータ版処理 チュートリアル再生
#
# @within function mhdp_core:phase/1_village/change_phase/check

# 1
    execute if score @s Ply.Ope.TutorialTrigger matches 80 run \
    tellraw @a[tag=!Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n【 チュートリアル：モンスターとの戦い方 ","color":"#00FFC3","bold": true},{"text":"1/3","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  モンスターと戦う時は、できるだけ回避を優先しましょう。\n"},\
        {"text":"  モンスターの攻撃は威力が高く、非常に危険です。\n"},\
        {"text":"  攻撃を受けると"},{"text":"吹き飛ばされ、しばらく武器が使えなくなります","color": "#ff9900","bold": true},{"text": " 。\n"},\
        {"text":"  モンスターが攻撃してきそうな予兆を見せた場合、\n"},\
        {"text":"  武器を納刀し、モンスターから離れて攻撃を回避しましょう。\n"},\
        {"text":"\n  "},\
        {"text":"l","click_event":{"action":"run_command","command":"/return 0"},"color": "#7a7a7a","font":"icons/book"},{"text":"                                                            "},\
        {"text":"r","click_event":{"action":"run_command","command":"/trigger Ply.Ope.TutorialTrigger set 81"},"color": "#ff7300","font":"icons/book"},\
        {"text":"\n"}\
    ]

    execute if score @s Ply.Ope.TutorialTrigger matches 81 run \
    tellraw @a[tag=!Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n【 チュートリアル：モンスターとの戦い方 ","color":"#00FFC3","bold": true},{"text":"2/3","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  モンスターは、攻撃後に隙が生じます。\n"},\
        {"text":"  無理に攻めずに、少し離れてモンスターの動きを見ながら、\n"},\
        {"text":"  攻撃後の隙を狙うようにすると、安全に戦うことができます。\n"},\
        {"text":"\n  "},\
        {"text":"l","click_event":{"action":"run_command","command":"/trigger Ply.Ope.TutorialTrigger set 80"},"color": "#ff7300","font":"icons/book"},{"text":"                                                            "},\
        {"text":"r","click_event":{"action":"run_command","command":"/trigger Ply.Ope.TutorialTrigger set 82"},"color": "#ff7300","font":"icons/book"},\
        {"text":"\n"}\
    ]

    execute if score @s Ply.Ope.TutorialTrigger matches 82 run \
    tellraw @a[tag=!Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n【 チュートリアル：モンスターとの戦い方 ","color":"#00FFC3","bold": true},{"text":"3/3","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  また、モンスターは "},{"text":"咆哮や風圧","color": "#ff9900","bold": true},{"text": " を使うことがあります。\n"},\
        {"text":"  咆哮を受けると、 "},{"text":"しばらく移動できなくなります","color": "#ff9900","bold": true},{"text": " 。\n"},\
        {"text":"  風圧を受けると、 "},{"text":"モンスターから離れるように飛ばされます","color": "#ff9900","bold": true},{"text": " 。\n"},\
        {"text":"  どちらもダメージはありませんが、できる限り回避するようにしましょう。\n"},\
        {"text":"\n  "},\
        {"text":"l","click_event":{"action":"run_command","command":"/trigger Ply.Ope.TutorialTrigger set 81"},"color": "#ff7300","font":"icons/book"},{"text":"                                                            "},\
        {"text":"r","click_event":{"action":"run_command","command":"/return 0"},"color": "#7a7a7a","font":"icons/book"},\
        {"text":"\n"}\
    ]
