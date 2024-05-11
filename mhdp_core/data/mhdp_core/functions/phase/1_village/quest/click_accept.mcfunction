#> mhdp_core:phase/1_village/quest/click_accept
#
# クエスト受注書の受注ボタンクリック時に実行
#
# @within function mhdp_core:phase/1_village/main

# フェーズ確認
    execute unless data storage mhdp_core:game_data {Phase:1} run tellraw @s {"text": "【現在クエスト中です。終了までお待ちください】"}

# クエストID確認
    # クエストIDが同じ場合、キャンセル処理
        execute if data storage mhdp_core:game_data {Phase:1} if score @s Ply.Ope.AcceptedQuestId = #mhdp_core_loading_quest_id MhdpCore run function mhdp_core:phase/1_village/quest/cancel/only
    # クエストIDが異なる場合、受注処理
        execute if data storage mhdp_core:game_data {Phase:1} unless score @s Ply.Ope.AcceptedQuestId = #mhdp_core_loading_quest_id MhdpCore run function mhdp_core:phase/1_village/quest/accept/main

# 終了
    scoreboard players set @s Ply.Ope.AcceptedQuestId -1
