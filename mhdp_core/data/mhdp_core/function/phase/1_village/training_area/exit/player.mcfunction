#> mhdp_core:phase/1_village/training_area/exit/player
#
# 訓練所から戻る
#
# @within function 

# 武器の使用終了処理
# クエスト→村Phaseでの処理を流用する
    function mhdp_core:phase/3_quest/change_phase/general/player/reset

# 訓練所利用タグを削除
    tag @s remove Ply.State.IsTraining
    tag @s remove Vlg.WeaponTutorial.TargetPlayer

# 自身が最後の訓練所利用者だった場合、チュートリアルを中止
    execute unless entity @a[tag=Ply.State.IsTraining] run function mhdp_core:phase/1_village/villager/weapon_tutorial/end

# 通知
    tellraw @s {"text":"【訓練を終了しました】"}

# 村に移動
# 現在、訓練所にUIが置かれているので移動はしない
    # function mhdp_core:utils/tp with storage mhdp_core:game_data PositionList[{ID:"TrainingToVillage"}]
    # function mhdp_core:utils/set_spawnpoint with storage mhdp_core:game_data PositionList[{ID:"InitialSpawnPoint"}]
