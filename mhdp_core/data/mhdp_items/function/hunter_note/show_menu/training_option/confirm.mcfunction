#> mhdp_items:hunter_note/show_menu/training_option/confirm
#
# ハンターノート操作 訓練所オプション
#
# @within function mhdp_core:player/tick

# 設定の適用

# からくり飛竜モード
    scoreboard players operation @s Ply.Ope.HunterNote.TrainingOptions %= #const_1000 Const
    execute unless score @s Ply.Ope.HunterNote.TrainingOptions matches 200.. as @n[type=item_display,tag=Mns.Root.Karakuri] unless score @s Mns.General.DummyCounter matches ..0 run function mhdp_monster_karakuri:core/util/change_phase_idle
    execute if score @s Ply.Ope.HunterNote.TrainingOptions matches 200.. as @n[type=item_display,tag=Mns.Root.Karakuri] unless score @s Mns.General.DummyCounter matches 1.. run function mhdp_monster_karakuri:core/util/change_phase_attack

# 特殊装具クールダウン
    scoreboard players operation @s Ply.Ope.HunterNote.TrainingOptions %= #const_100 Const
    execute unless score @s Ply.Ope.HunterNote.TrainingOptions matches 20.. run tag @s remove Ply.Option.Training.IsSpItemInfinity
    execute if score @s Ply.Ope.HunterNote.TrainingOptions matches 20.. run tag @s add Ply.Option.Training.IsSpItemInfinity

# 狩技ゲージ
    scoreboard players operation @s Ply.Ope.HunterNote.TrainingOptions %= #const_10 Const
    execute unless score @s Ply.Ope.HunterNote.TrainingOptions matches 2.. run tag @s remove Ply.Option.Training.IsArtsGaugeInfinity
    execute if score @s Ply.Ope.HunterNote.TrainingOptions matches 2.. run tag @s add Ply.Option.Training.IsArtsGaugeInfinity

# 戻る
    function mhdp_items:hunter_note/show_menu/training/show
