#> mhdp_core:phase/3_quest/change_phase/general/main
#
# 次Phaseへ遷移 共通処理
#
# @within
#    function mhdp_core:phase/3_quest/change_phase/succeed/change
#    function mhdp_core:phase/3_quest/change_phase/failed/change

# プレイヤーを拠点に戻す
    tp @a[tag=Ply.State.PlayingQuest] 266 63 204
    spawnpoint @a[tag=Ply.State.PlayingQuest] 266 63 204

# TODO: プレイヤーの状態リセット
    tag @a remove Ply.State.PlayingQuest
    tag @a remove Ply.State.EnableDamage
    tag @a remove Ply.State.MnsTarget
    # tag @a remove Ply.State.QuestHost
    # tag @a remove Ply.State.QuestMember

# TODO: モンスター用データパックのdisable

# ActiveQuestの解放
    scoreboard players set #mhdp_core_loading_quest_id MhdpCore -1
    data modify storage mhdp_core:game_data ActiveQuest set value {}

# フェーズ変更
    data modify storage mhdp_core:game_data Phase set value 1
    scoreboard players set #mhdp_core_timer MhdpCore 0
