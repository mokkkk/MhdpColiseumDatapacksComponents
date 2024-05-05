#> mhdp_core:phase/1_village/quest/click_accept
#
# クエスト受注書の受注ボタンクリック時に実行
#
# @within function mhdp_core:phase/1_village/main

# フェーズ確認
    execute unless data storage mhdp_core:game_data {Phase:1} run tellraw @s {"text": "【現在クエスト中です。終了までお待ちください】"}
    execute if data storage mhdp_core:game_data {Phase:1} run function mhdp_core:phase/1_village/quest/accept/main

# 終了
    scoreboard players set @s Ply.Ope.AcceptedQuestId -1
