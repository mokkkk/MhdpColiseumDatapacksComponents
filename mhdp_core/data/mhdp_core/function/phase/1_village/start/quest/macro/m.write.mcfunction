#> mhdp_core:phase/1_village/start/quest/macro/m.write
#
# クエスト内容の出力
#
# @within function mhdp_core:phase/1_village/start/quest/put_to_book

# 非表示の場合、スキップ
    execute if data storage mhdp_core:temp TargetQuest.State{Visible:false} run return 0

# 記入
    $data modify block $(Pos) Book.components."minecraft:written_book_content".pages append value {raw:[\
        {"text":"$(State)\n","bold":true,"color":$(Color)},\
        {"text":"$(Name)\n","bold":true,"color":black},\
        $(Newline),\
        {"text":"難易度：","bold":false,"color":black},\
        {"text":"$(Level)\n","bold":false,"color":gold},\
        {"text":"ターゲット：\n\n","bold":false,"color":black},\
        $(Monster1),\
        {"text":" "},\
        $(Monster2),\
        {"text":" "},\
        $(Monster3),\
        {"text":" "},\
        $(Monster4),\
        {"text":" "},\
        $(Monster5),\
        {"text":""},\
        {"text":"報酬金：$(Reward)エメラルド\n","bold":false,"color":black},\
        {"text":"目的地：$(Field)\n","bold":false,"color":black},\
        {"text":"制限時間：$(TimeLimit)分\n","bold":false,"color":black},\
        {"text":"失敗条件：$(DeathCount)回力尽きる\n\n","bold":false,"color":black},\
        {"text":"$(Indent)","bold":false},\
        {"text":"$(Button)","bold":true,"color":red,"click_event":{"action":"run_command","command":"/trigger Ply.Ope.AcceptedQuestId set $(ID)"}}\
    ]}

# 直前に受けたクエストIDと出力中のクエストIDが一致する場合、開いているページを設定する
    $execute if data storage mhdp_core:temp TargetQuest{Pos:0} if score #mhdp_core_pre_played_quest_id MhdpCore matches $(ID) store result block $(Pos) Page int 1 run scoreboard players get #mhdp_temp_page_normal MhdpCore
    $execute if data storage mhdp_core:temp TargetQuest{Pos:1} if score #mhdp_core_pre_played_quest_id MhdpCore matches $(ID) store result block $(Pos) Page int 1 run scoreboard players get #mhdp_temp_page_hard MhdpCore
    $execute if data storage mhdp_core:temp TargetQuest{Pos:2} if score #mhdp_core_pre_played_quest_id MhdpCore matches $(ID) store result block $(Pos) Page int 1 run scoreboard players get #mhdp_temp_page_extra MhdpCore

# ページ増加
    execute if data storage mhdp_core:temp TargetQuest{Pos:0} run scoreboard players add #mhdp_temp_page_normal MhdpCore 1
    execute if data storage mhdp_core:temp TargetQuest{Pos:1} run scoreboard players add #mhdp_temp_page_hard MhdpCore 1
    execute if data storage mhdp_core:temp TargetQuest{Pos:2} run scoreboard players add #mhdp_temp_page_extra MhdpCore 1

# 終了
    function mhdp_core:phase/1_village/start/quest/macro/util/m.write_apply_book_content with storage mhdp_core:game_data PositionList[{ID:"QuestBookKohaku"}]
