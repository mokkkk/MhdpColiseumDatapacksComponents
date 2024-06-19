#> mhdp_core:phase/1_village/quest/accept/macro/m.get_questdata
#
# クエスト受注処理 受注内容の表示
#
# @within function mhdp_core:phase/1_village/quest/accept/notify

# データの読み込み
    $data modify storage mhdp_core:temp TargetQuest set from storage mhdp_core:game_data QuestList[{ID:$(ActiveQuestId)}]

# 必要なデータの取り出し
    data modify storage mhdp_core:temp TargetQuest.Field set from storage mhdp_core:temp TargetQuest.Content.Field
