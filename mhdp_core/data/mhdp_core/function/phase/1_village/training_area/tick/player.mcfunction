#> mhdp_core:phase/1_village/training_area/tick/player
#
# 訓練所のtick処理
#
# @within function 

# 狩技ゲージ
    execute if entity @s[tag=Ply.Option.Training.IsArtsGaugeInfinity] run scoreboard players operation @s Ply.Stats.Arts.1 = @s Ply.Stats.Arts.1.Max
    execute if entity @s[tag=Ply.Option.Training.IsArtsGaugeInfinity] run scoreboard players operation @s Ply.Stats.Arts.2 = @s Ply.Stats.Arts.2.Max

# 建材ゲージ増加
    execute if score @s Ply.Stats.BuildGauge matches ..999 run scoreboard players add @s Ply.Stats.BuildGauge 5
