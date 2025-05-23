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
    execute as @a[tag=Ply.State.PlayingQuest] run function mhdp_core:phase/3_quest/change_phase/general/player/reset

# プレイヤーを拠点に戻す
    execute as @a[tag=Ply.State.PlayingQuest] run function mhdp_core:utils/tp with storage mhdp_core:game_data PositionList[{ID:"InitialSpawnPoint"}]
    execute as @a[tag=Ply.State.PlayingQuest] run function mhdp_core:utils/set_spawnpoint with storage mhdp_core:game_data PositionList[{ID:"InitialSpawnPoint"}]
    tag @a remove Ply.State.PlayingQuest

# モンスターのリセット処理
    function mhdp_core:phase/3_quest/change_phase/general/monster/main

# ActiveQuestの解放
    scoreboard players operation #mhdp_core_pre_played_quest_id MhdpCore = #mhdp_core_loading_quest_id MhdpCore
    scoreboard players set #mhdp_core_loading_quest_id MhdpCore -1
    data modify storage mhdp_core:game_data ActiveQuest set value {}
    scoreboard players reset #mhdp_quest_timer_max MhdpCore
    scoreboard players reset #mhdp_quest_timer MhdpCore
    scoreboard players reset #mhdp_quest_deathcount_max MhdpCore
    scoreboard players reset #mhdp_quest_deathcount MhdpCore
    time set 5000
    # 連番増加
        scoreboard players add #mhdp_core_quest_serial_id QuestSerialId 1
    # タイマー消去
        scoreboard objectives setdisplay sidebar.team.gray
        scoreboard players reset $mhdp_temp_quest_timer_text Quest.Timer.Text
        scoreboard players reset $mhdp_temp_quest_timer_value Quest.Timer.Text

# forceloadのリセット
    forceload remove all
    forceload add 0 0

# フェーズ変更
    data modify storage mhdp_core:game_data Phase set value 1
    scoreboard players set #mhdp_core_timer MhdpCore 0

# 落ちているアイテムの回収
    function mhdp_core:phase/2_village_to_quest/start/pickup

# 村の更新処理
    function mhdp_core:phase/1_village/start/main
