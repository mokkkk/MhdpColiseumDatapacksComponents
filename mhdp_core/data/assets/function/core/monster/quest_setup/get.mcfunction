#> assets:core/monster/quest_setup/get
#
# クエスト初期化時のモンスター配置処理

# データ取り出し
    data modify storage mhdp_core:temp Arg.MonsterUid set from storage mhdp_core:game_data ActiveQuest.TargetMonsters[0].MonsterId
    data modify storage mhdp_core:temp Arg.Timing set from storage mhdp_core:game_data ActiveQuest.TargetMonsters[0].Timing
    data modify storage mhdp_core:temp Arg.Override set from storage mhdp_core:game_data ActiveQuest.TargetMonsters[0].Override
    data modify storage mhdp_core:temp Arg.AreaId set from storage mhdp_core:game_data ActiveQuest.TargetMonsters[0].AreaId
    data remove storage mhdp_core:game_data ActiveQuest.TargetMonsters[0]
