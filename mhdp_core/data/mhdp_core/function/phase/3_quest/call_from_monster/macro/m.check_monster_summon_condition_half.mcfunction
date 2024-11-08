#> mhdp_core:phase/3_quest/call_from_monster/macro/m.check_monster_summon_condition_half
#
# モンスターから呼び出す処理 HP半減時
#
# @within function mhdp_core:phase/3_quest/call_from_monster/check_monster_summon_condition_half

# 対応するモンスターがいる場合、乱入処理を実行
    $data modify storage mhdp_core:temp Temp.IntrusionMonsterData set from storage mhdp_core:game_data ActiveQuest.TargetMonsters[{MonsterId:$(SummonMonsterUid)}]
    $execute if data storage mhdp_core:temp Temp.IntrusionMonsterData{Timing:"Half",TargetMonsterId:$(MonsterUid)} run function mhdp_core:phase/3_quest/call_from_monster/macro/m.intrusion
    # $execute if data storage mhdp_core:temp Temp.IntrusionMonsterData{Timing:"Half",TargetMonsterId:$(MonsterUid)} run function mhdp_monsters:core/switch/intrusion
    data remove storage mhdp_core:temp Temp.IntrusionMonsterData
