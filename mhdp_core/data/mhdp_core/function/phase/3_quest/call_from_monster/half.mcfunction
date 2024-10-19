#> mhdp_core:phase/3_quest/call_from_monster/half
#
# モンスターから呼び出す処理 HP半減時
#
# @within function mhdp_monsters:core/util/damage/check_hp_half
# @input storage mhdp_core:temp Arg.MonsterUid モンスターのUid

# 他にモンスターがいる場合、出現条件を確認
    # 出現モンスターの一覧をコピー
        data modify storage mhdp_core:temp Temp.TargetMonsters set from storage mhdp_core:game_data ActiveQuest.TargetMonsters
    # 死亡モンスターのUidを保持
        data modify storage mhdp_core:temp Temp.DeathMonsterUid set from storage mhdp_core:temp Arg.MonsterUid
    # チェック
        execute if data storage mhdp_core:temp Temp.TargetMonsters[0] run function mhdp_core:phase/3_quest/call_from_monster/check_monster_summon_condition_half
    # 終了
        data remove storage mhdp_core:temp Temp

# 終了
    data remove storage mhdp_core:temp Arg

# say モンスターHP半減