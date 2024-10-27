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

# 村に移動
    tp @s 250 64 213 180 ~
    spawnpoint @s 266 63 204
