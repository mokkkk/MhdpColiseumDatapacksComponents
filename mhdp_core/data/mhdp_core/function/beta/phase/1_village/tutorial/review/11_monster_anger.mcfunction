#> mhdp_core:beta/phase/1_village/tutorial/review/11_monster_anger
#
# ベータ版処理 チュートリアル再生
#
# @within function mhdp_core:phase/1_village/change_phase/check

# 1
    execute if score @s Ply.Ope.TutorialTrigger matches 100 run \
    tellraw @a[tag=!Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n【 チュートリアル：怒り状態 ","color":"#00FFC3","bold": true},{"text":"1/2","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  ある程度ダメージを与えると、モンスターが "},{"text":"怒り状態","color": "#ff9900","bold": true},{"text": " になります。\n"},\
        {"text":"  怒り状態のモンスターのHPバーには "},{"text":"\uE001","font":"minecraft:ui/monster_hp","color": "white","bold": false},{"text":" のようなアイコンが出ます。\n"},\
        {"text":"  怒ったモンスターは、"},{"text":"攻撃力と行動速度","color": "#ff9900","bold": true},{"text": " が上昇します。\n"},\
        {"text":"  モンスターによっては、怒り状態専用の行動をとることがあります。\n"},\
        {"text":"\n  "},\
        {"text":"l","click_event":{"action":"run_command","command":"/return 0"},"color": "#7a7a7a","font":"icons/book"},{"text":"                                                            "},\
        {"text":"r","click_event":{"action":"run_command","command":"/trigger Ply.Ope.TutorialTrigger set 101"},"color": "#ff7300","font":"icons/book"},\
        {"text":"\n"}\
    ]

    execute if score @s Ply.Ope.TutorialTrigger matches 101 run \
    tellraw @a[tag=!Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n【 チュートリアル：怒り状態 ","color":"#00FFC3","bold": true},{"text":"2/2","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  行動速度が上がるため、隙も少なく、とても危険な状態です。\n"},\
        {"text":"  慣れないうちは、攻撃の回避に徹することも重要です。\n"},\
        {"text":"\n  "},\
        {"text":"l","click_event":{"action":"run_command","command":"/trigger Ply.Ope.TutorialTrigger set 100"},"color": "#ff7300","font":"icons/book"},{"text":"                                                            "},\
        {"text":"r","click_event":{"action":"run_command","command":"/return 0"},"color": "#7a7a7a","font":"icons/book"},\
        {"text":"\n"}\
    ]
