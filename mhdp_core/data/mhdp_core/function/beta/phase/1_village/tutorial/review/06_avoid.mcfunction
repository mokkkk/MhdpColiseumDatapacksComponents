#> mhdp_core:beta/phase/1_village/tutorial/review/06_avoid
#
# ベータ版処理 チュートリアル再生
#
# @within function mhdp_core:phase/1_village/change_phase/check

# 1
    execute if score @s Ply.Ope.TutorialTrigger matches 50 run \
    tellraw @a[tag=!Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n【 チュートリアル：回避 ","color":"#00FFC3","bold": true},{"text":"1/2","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  "},{"text":"ダッシュジャンプ","color": "#ff9900","bold": true},{"text": " の出始めには、無敵時間があります。\n"},\
        {"text":"  その間にモンスターの攻撃に当たると "},{"text":"ジャンプ回避","color": "#ff9900","bold": true},{"text": " が発動します。\n"},\
        {"text":"  武器の攻撃中はジャンプできないため、\n  攻撃の手を止めるか、納刀する必要があります。\n"},\
        {"text":"\n  "},\
        {"text":"l","clickEvent":{"action":"run_command","value":"/return 0"},"color": "#7a7a7a","font":"icons/book"},{"text":"                                                            "},\
        {"text":"r","clickEvent":{"action":"run_command","value":"/trigger Ply.Ope.TutorialTrigger set 51"},"color": "#ff7300","font":"icons/book"},\
        {"text":"\n"}\
    ]

    execute if score @s Ply.Ope.TutorialTrigger matches 51 run \
    tellraw @a[tag=!Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n【 チュートリアル：回避 ","color":"#00FFC3","bold": true},{"text":"2/2","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  無敵時間は短いため、成功させるのは難しいですが、\n"},\
        {"text":"  成功すると "},{"text":"ダメージとノックバックを完全に無効化","color": "#ff9900","bold": true},{"text": " できます。\n"},\
        {"text":"  また、攻撃の他にも、咆哮や風圧によるノックバックも無効化できます。\n"},\
        {"text":"\n  "},\
        {"text":"l","clickEvent":{"action":"run_command","value":"/trigger Ply.Ope.TutorialTrigger set 50"},"color": "#ff7300","font":"icons/book"},{"text":"                                                            "},\
        {"text":"r","clickEvent":{"action":"run_command","value":"/return 0"},"color": "#7a7a7a","font":"icons/book"},\
        {"text":"\n"}\
    ]
