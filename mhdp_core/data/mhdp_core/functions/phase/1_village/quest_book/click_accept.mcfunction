#> mhdp_core:phase/1_village/quest_book/click_accept
#
# クエスト受注書の受注ボタンクリック時に実行
#
# @within function mhdp_core:player/advancement/interaction/interact_ui

# クエストIDを設定
    scoreboard players operation #mhdp_core_loading_quest_id MhdpCore = @s Ply.Ope.AcceptedQuestId

# 終了
    scoreboard players set @s Ply.Ope.AcceptedQuestId -1
