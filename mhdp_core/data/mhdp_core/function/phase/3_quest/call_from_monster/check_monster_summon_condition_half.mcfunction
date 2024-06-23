#> mhdp_core:phase/3_quest/call_from_monster/check_monster_summon_condition_half
#
# モンスターから呼び出す処理 HP半減時
#
# @within 
#         function mhdp_core:phase/3_quest/call_from_monster/half
#         function mhdp_core:phase/3_quest/call_from_monster/check_monster_summon_condition_half

# 出現条件確認
    data modify storage mhdp_core:temp Arg.SummonMonsterUid set from storage mhdp_core:temp Temp.TargetMonsters[0].MonsterId
    data modify storage mhdp_core:temp Arg.MonsterUid set from storage mhdp_core:temp Temp.DeathMonsterUid
    function mhdp_core:phase/3_quest/call_from_monster/macro/m.check_monster_summon_condition_half with storage mhdp_core:temp Arg
    data remove storage mhdp_core:temp Temp.TargetMonsters[0]

# データが残っている場合繰り返す
    execute if data storage mhdp_core:temp Temp.TargetMonsters[0] run function mhdp_core:phase/3_quest/call_from_monster/check_monster_summon_condition_half
