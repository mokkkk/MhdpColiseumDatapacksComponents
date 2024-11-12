#> mhdp_core:player/phase_quest/cancel_quest/main
#
# クエストを中断して拠点に帰還する
#
# @within function mhdp_core:player/phase_quest/tick

# 通知
    tellraw @s {"text":"【参加していたクエストが終了したため、拠点に帰還しました】","color": "red"}

# 状態リセット
    function mhdp_core:phase/3_quest/change_phase/general/player/reset

# 拠点に戻る
    execute as @a[tag=Ply.State.PlayingQuest] run function mhdp_core:utils/tp with storage mhdp_core:game_data PositionList[{ID:"InitialSpawnPoint"}]
    execute as @a[tag=Ply.State.PlayingQuest] run function mhdp_core:utils/set_spawnpoint with storage mhdp_core:game_data PositionList[{ID:"InitialSpawnPoint"}]
    tag @s remove Ply.State.PlayingQuest
