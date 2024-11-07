#> mhdp_core:phase/1_village/training_area/enter/check
#
# 次Phaseへ遷移できるか確認する
#
# @within function mhdp_core:phase/1_village/bell/click

# 通知
    playsound ui.button.click master @s ~ ~ ~ 1 1

# 訓練所を利用していない場合、訓練開始
    execute if entity @s[tag=!Ply.State.IsTraining] run return run function mhdp_core:phase/1_village/training_area/enter/check

# 訓練所利用中の場合、訓練終了
    execute if entity @s[tag=Ply.State.IsTraining] run return run function mhdp_core:phase/1_village/training_area/exit/player
