#> mhdp_core:phase/1_village/training_area/tick/main
#
# 訓練所のtick処理
#
# @within function 

# プレイヤー毎
    execute as @a[tag=Ply.State.IsTraining] at @s run function mhdp_core:phase/1_village/training_area/tick/player
