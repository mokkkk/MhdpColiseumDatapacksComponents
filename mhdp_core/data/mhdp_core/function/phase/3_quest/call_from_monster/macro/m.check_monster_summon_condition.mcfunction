#> mhdp_core:phase/3_quest/call_from_monster/macro/m.check_monster_summon_condition
#
# モンスターから呼び出す処理 死亡時
#
# @within function mhdp_core:phase/3_quest/call_from_monster/death

# 対応するモンスターがいる場合、乱入処理を実行
    $data modify storage mhdp_core:temp Temp.IntrusionMonsterData set from storage mhdp_core:game_data ActiveQuest.TargetMonsters[{MonsterId:$(SummonMonsterUid)}]
    $execute if data storage mhdp_core:temp Temp.IntrusionMonsterData{Timing:"Death",TargetMonsterId:$(MonsterUid)} run function mhdp_core:phase/3_quest/call_from_monster/macro/m.intrusion
    # $execute if data storage mhdp_core:temp Temp.IntrusionMonsterData{Timing:"Death",TargetMonsterId:$(MonsterUid)} run function mhdp_monsters:core/switch/intrusion
    data remove storage mhdp_core:temp Temp.IntrusionMonsterData
