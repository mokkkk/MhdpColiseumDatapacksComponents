#> mhdp_core:phase/1_village/change_phase/macro/m.check_quest_exist
#
# 次Phaseへ遷移できるか確認する
#
# @within function mhdp_core:phase/1_village/change_phase/check_quest

# クエストの存在チェック
    $execute unless data storage mhdp_core:game_data QuestList[{ID:$(ActiveQuestId)}] run data modify storage mhdp_core:temp Errors.IsQuestNotExist set value true
