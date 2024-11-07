#> mhdp_core:phase/1_village/training_area/enter/player
#
# 訓練所に移動する プレイヤー初期化処理
#
# @within function 

# 武器の使用開始処理
# 村→クエストPhaseでの処理を流用する
    function mhdp_core:phase/2_village_to_quest/start/quest_member
    function mhdp_core:phase/2_village_to_quest/change_phase/setup/player/main
    tag @s remove Ply.State.PlayingQuest
    team leave @s

# 訓練所利用タグを付与
    tag @s add Ply.State.IsTraining

# 通知
    tellraw @s {"text":"【訓練を開始します】"}

# 訓練所に移動
# 現在、訓練所にUIが置かれているので移動はしない
    # function mhdp_core:utils/tp with storage mhdp_core:game_data PositionList[{ID:"TrainingSpawnPoint"}]
    # function mhdp_core:utils/set_spawnpoint with storage mhdp_core:game_data PositionList[{ID:"TrainingSpawnPoint"}]
