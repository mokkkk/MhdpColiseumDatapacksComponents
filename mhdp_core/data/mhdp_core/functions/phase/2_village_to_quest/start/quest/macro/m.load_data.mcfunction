#> mhdp_core:phase/2_village_to_quest/start/quest/macro/m.load_data
#
# クエストデータのロード IDを使用してストレージからデータを読み込む
#
# @within function mhdp_core:phase/2_village_to_quest/start/quest/main

# データの読み込み
    $data modify storage mhdp_core:game_data ActiveQuest set from storage mhdp_core:game_data QuestList[{ID:$(ActiveQuestId)}].Content
