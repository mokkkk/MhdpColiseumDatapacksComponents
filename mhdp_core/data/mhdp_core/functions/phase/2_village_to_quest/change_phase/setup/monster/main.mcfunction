#> mhdp_core:phase/2_village_to_quest/change_phase/setup/monster/main
#
# クエスト開始処理
#
# @within
#     function mhdp_core:phase/2_village_to_quest/change_phase/setup/main
#     function mhdp_core:phase/2_village_to_quest/change_phase/setup/monster/main

# モンスターIDを取得
    data modify storage mhdp_core:temp Arg.MonsterUid set from storage mhdp_core:game_data ActiveQuest.TargetMonsters[0].MonsterId
    data modify storage mhdp_core:temp Arg.Timing set from storage mhdp_core:game_data ActiveQuest.TargetMonsters[0].Timing
    data remove storage mhdp_core:game_data ActiveQuest.TargetMonsters[0]

# 出現条件が最初からの場合、配置処理
    execute if data storage mhdp_core:temp Arg{Timing:"Initial"} run function mhdp_monsters:core/switch/summon
    data modify storage mhdp_core:temp MonsterQuestData set from storage mhdp_core:temp Arg
    data remove storage mhdp_core:temp Arg

# データが残っている場合、繰り返す
    execute if data storage mhdp_core:game_data ActiveQuest.TargetMonsters[0] run function mhdp_core:phase/2_village_to_quest/change_phase/setup/monster/main
