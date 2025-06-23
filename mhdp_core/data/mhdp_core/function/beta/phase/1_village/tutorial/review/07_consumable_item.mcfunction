#> mhdp_core:beta/phase/1_village/tutorial/review/07_consumable_item
#
# ベータ版処理 チュートリアル再生
#
# @within function mhdp_core:phase/1_village/change_phase/check

# 1
    execute if score @s Ply.Ope.TutorialTrigger matches 60 run \
    tellraw @a[tag=!Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n【 チュートリアル：アイテム ","color":"#00FFC3","bold": true},{"text":"1/1","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  アイテムには、 "},{"text":"消費アイテム","color": "#ff9900","bold": true},{"text":" と "},{"text":"特殊装具","color": "#ff9900","bold": true},{"text": " があります。\n"},\
        {"text":"  アイテムの効果は、説明文に書かれています。\n"},\
        {"text":"  回復薬などの消費アイテムは使用すると無くなるので、\n"},\
        {"text":"  クエスト中に使える回数には限りがあります。\n"},\
        {"text":"\n  "},\
        {"text":"l","click_event":{"action":"run_command","command":"/return 0"},"color": "#7a7a7a","font":"icons/book"},{"text":"                                                            "},\
        {"text":"r","click_event":{"action":"run_command","command":"/return 0"},"color": "#7a7a7a","font":"icons/book"},\
        {"text":"\n"}\
    ]
