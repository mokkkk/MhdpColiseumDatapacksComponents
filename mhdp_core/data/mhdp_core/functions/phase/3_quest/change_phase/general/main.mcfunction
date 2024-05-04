#> mhdp_core:phase/3_quest/change_phase/general/main
#
# 次Phaseへ遷移 共通処理
#
# @within
#    function mhdp_core:phase/3_quest/change_phase/succeed/change
#    function mhdp_core:phase/3_quest/change_phase/failed/change

# 中心点の削除
    kill @e[type=marker,tag=Mk.Field.Center]
    kill @e[type=marker,tag=Mk.Field.Back]

# プレイヤーの状態リセット
    execute as @a run function mhdp_core:phase/3_quest/change_phase/general/player/reset

# プレイヤーを拠点に戻す
    tp @a[tag=Ply.State.PlayingQuest] 266 63 204
    spawnpoint @a[tag=Ply.State.PlayingQuest] 266 63 204
    tag @a remove Ply.State.PlayingQuest

# TODO: モンスター用データパックのdisable

# ActiveQuestの解放
    scoreboard players set #mhdp_core_loading_quest_id MhdpCore -1
    data modify storage mhdp_core:game_data ActiveQuest set value {}
    scoreboard players reset #mhdp_quest_timer_max MhdpCore
    scoreboard players reset #mhdp_quest_timer MhdpCore
    scoreboard players reset #mhdp_quest_deathcount_max MhdpCore
    scoreboard players reset #mhdp_quest_deathcount MhdpCore

# フェーズ変更
    data modify storage mhdp_core:game_data Phase set value 1
    scoreboard players set #mhdp_core_timer MhdpCore 0

# 村の更新処理
    function mhdp_core:phase/1_village/start/main
