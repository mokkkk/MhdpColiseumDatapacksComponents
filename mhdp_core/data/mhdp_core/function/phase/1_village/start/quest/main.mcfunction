#> mhdp_core:phase/1_village/start/quest/main
#
# 村Phase開始・更新処理 クエスト受注書の更新
#
# @within function mhdp_core:phase/1_village/start/main

# クエスト一覧をコピー
    data modify storage mhdp_core:temp TempQuestList set from storage mhdp_core:game_data QuestList

# 書見台をリセット
    # 下位
        scoreboard players set #mhdp_temp_page_normal MhdpCore 0
        function mhdp_core:phase/1_village/start/quest/macro/util/m.reset_book_normal with storage mhdp_core:game_data PositionList[{ID:"QuestBookKohaku"}]
    # 上位
        scoreboard players set #mhdp_temp_page_hard MhdpCore 0
        # function mhdp_core:phase/1_village/start/quest/macro/util/m.reset_book_hard with storage mhdp_core:game_data PositionList[{ID:"QuestBookKohaku"}]
    # 特殊
        scoreboard players set #mhdp_temp_page_extra MhdpCore 0
        # function mhdp_core:phase/1_village/start/quest/macro/util/m.reset_book_extra with storage mhdp_core:game_data PositionList[{ID:"QuestBookKohaku"}]

# クエスト受注書を作成する
    execute if data storage mhdp_core:temp TempQuestList[0] run function mhdp_core:phase/1_village/start/quest/put_to_book

# 適用
    function mhdp_core:phase/1_village/start/quest/macro/util/m.apply_book_content with storage mhdp_core:game_data PositionList[{ID:"QuestBookKohaku"}]
    
# 終了
    scoreboard players reset #mhdp_temp_page_normal MhdpCore
    scoreboard players reset #mhdp_temp_page_hard MhdpCore
    scoreboard players reset #mhdp_temp_page_extra MhdpCore
    data remove storage mhdp_core:temp TempQuestList
