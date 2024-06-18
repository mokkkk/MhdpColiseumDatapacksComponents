#> mhdp_core:phase/3_quest/call_from_monster/death
#
# モンスターから呼び出す処理 死亡時
#
# @within function mhdp_core:player/phase_quest/death_animation/end_on_quest

# 対応するモンスターのデータを消去
    function mhdp_core:phase/3_quest/call_from_monster/macro/m.remove_target_monster with storage mhdp_core:temp Arg

# 他にモンスターがいる場合、出現条件を確認
    # 出現モンスターの一覧をコピー
        data modify storage mhdp_core:temp Temp.TargetMonsters set from storage mhdp_core:game_data ActiveQuest.TargetMonsters
    # 死亡モンスターのUidを保持
        data modify storage mhdp_core:temp Temp.DeathMonsterUid set from storage mhdp_core:temp Arg.MonsterUid
    # チェック
        execute if data storage mhdp_core:temp Temp.TargetMonsters[0] run function mhdp_core:phase/3_quest/call_from_monster/check_monster_summon_condition
    # 終了
        data remove storage mhdp_core:temp Temp

# ActiveQuest.TargetMonstersが空になったとき、クエストをクリアにする
    execute unless data storage mhdp_core:game_data ActiveQuest.TargetMonsters[0] run function mhdp_core:phase/3_quest/end/succeed

# 終了
    data remove storage mhdp_core:temp Arg
