#> mhdp_core:beta/phase/1_village/tutorial/review/08_sp_item_wirebug
#
# ベータ版処理 チュートリアル再生
#
# @within function mhdp_core:phase/1_village/change_phase/check

# 1
    execute if score @s Ply.Ope.TutorialTrigger matches 70 run \
    tellraw @a[tag=!Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n【 チュートリアル：特殊装具 ","color":"#00FFC3","bold": true},{"text":"1/3","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  "},{"text":"特殊装具","color": "#ff9900","bold": true},{"text":" は使ってもなくなりませんが、\n  "},{"text":"クールタイム","color": "#ff9900","bold": true},{"text":" があり、連続では使用できません。\n"},\
        {"text":"  クールタイムは、スタミナの上部に表示されています。\n"},\
        {"text":"  アイテムのアイコンが灰色の間は使用できません。\n"},\
        {"text":"\n  "},\
        {"text":"l","clickEvent":{"action":"run_command","value":"/return 0"},"color": "#7a7a7a","font":"icons/book"},{"text":"                                                            "},\
        {"text":"r","clickEvent":{"action":"run_command","value":"/trigger Ply.Ope.TutorialTrigger set 71"},"color": "#ff7300","font":"icons/book"},\
        {"text":"\n"}\
    ]

    execute if score @s Ply.Ope.TutorialTrigger matches 71 run \
    tellraw @a[tag=!Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n【 チュートリアル：特殊装具 ","color":"#00FFC3","bold": true},{"text":"2/3","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  特殊装具は、それぞれユニークな効果を持っています。\n"},\
        {"text":"  例えば "},{"text":"不動の装衣","color": "#ff9900","bold": true},{"text":" の使用中は、攻撃を受けても怯まなくなります。\n"},\
        {"text":"  使用中は、アイテムアイコンが黄色く光ります。\n"},\
        {"text":"  モンスターの攻撃を無視できるため、強力な攻撃を当てやすくなります。\n"},\
        {"text":"\n  "},\
        {"text":"l","clickEvent":{"action":"run_command","value":"/trigger Ply.Ope.TutorialTrigger set 70"},"color": "#ff7300","font":"icons/book"},{"text":"                                                            "},\
        {"text":"r","clickEvent":{"action":"run_command","value":"/trigger Ply.Ope.TutorialTrigger set 72"},"color": "#ff7300","font":"icons/book"},\
        {"text":"\n"}\
    ]

    execute if score @s Ply.Ope.TutorialTrigger matches 72 run \
    tellraw @a[tag=!Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n【 チュートリアル：特殊装具 ","color":"#00FFC3","bold": true},{"text":"3/3","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  "},{"text":"翔蟲","color": "#ff9900","bold": true},{"text":" を使うと、正面方向に高速移動できます。\n"},\
        {"text":"  空を飛んでモンスターの攻撃を回避することもできます。\n"},\
        {"text":"  さらに、翔蟲による移動中に"},{"text":"抜刀攻撃"},{"text":" をすると、\n"},\
        {"text":"  "},{"text":"鉄蟲糸技","color": "#ff9900","bold": true},{"text":" という特殊な攻撃を行うことができます。\n"},\
        {"text":"  抜刀攻撃を行いやすくするために、\n  翔蟲の隣のアイテム欄は空にしておくのがおすすめです。\n"},\
        {"text":"\n  "},\
        {"text":"l","clickEvent":{"action":"run_command","value":"/trigger Ply.Ope.TutorialTrigger set 71"},"color": "#ff7300","font":"icons/book"},{"text":"                                                            "},\
        {"text":"r","clickEvent":{"action":"run_command","value":"/return 0"},"color": "#7a7a7a","font":"icons/book"},\
        {"text":"\n"}\
    ]
