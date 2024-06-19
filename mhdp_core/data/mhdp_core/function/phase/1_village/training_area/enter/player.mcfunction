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
