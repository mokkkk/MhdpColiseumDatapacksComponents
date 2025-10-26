#> debug:clear_quest.m
#
# 対象クエストの強制クリア
#
# @input storage api: Arg.QuestId 対象クエストID

# 値直接指定時の対応のため、Arg.Countを上書き
    $data modify storage mhdp_core:game_data QuestList[{ID:$(QuestId)}].State.IsPlayed set value true
    $data modify storage mhdp_core:game_data QuestList[{ID:$(QuestId)}].State.IsCleared set value true
    $data modify storage mhdp_core:game_data QuestList[{ID:$(QuestId)}].State.IsHardCleared set value true

# 村状態更新
    function mhdp_core:phase/1_village/start/main
