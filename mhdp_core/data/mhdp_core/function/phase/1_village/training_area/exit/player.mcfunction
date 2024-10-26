#> mhdp_core:phase/1_village/training_area/exit/player
#
# 訓練所から戻る
#
# @within function 

# 武器の使用終了処理
# クエスト→村Phaseでの処理を流用する
    function mhdp_core:phase/3_quest/change_phase/general/player/reset

# 村に移動
    tp @s 250 64 213 180 ~
