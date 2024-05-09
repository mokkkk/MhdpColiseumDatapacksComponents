#> mhdp_core:phase/3_quest/change_phase/succeed/macro/m.update_data
#
# クエストデータのロード IDを使用してストレージからデータを読み込む
#
# @within function mhdp_core:phase/2_village_to_quest/start/quest/main

# 対象クエストをクリア済みにする
    $data modify storage mhdp_core:game_data QuestList[{ID:$(ActiveQuestId)}].State.IsCleared set value true

# ハードコアの場合、対象クエストをハードコアクリア済みにする
    $execute if data storage mhdp_core:game_data {IsHardcore:true} run data modify storage mhdp_core:game_data QuestList[{ID:$(ActiveQuestId)}].State.IsHardCleared set value true
