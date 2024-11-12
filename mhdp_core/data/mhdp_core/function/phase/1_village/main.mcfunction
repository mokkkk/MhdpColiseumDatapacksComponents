#> mhdp_core:phase/1_village/main
#
# 村のtick処理
#
# @within function mhdp_core:tick

# クエスト受注
    execute if data storage mhdp_core:game_data {Phase:1} as @a run scoreboard players enable @s Ply.Ope.AcceptedQuestId
    execute as @a if score @s Ply.Ope.AcceptedQuestId matches 0.. run function mhdp_core:phase/1_village/quest/click_accept

# 村人など
    execute as @e[type=item_display,tag=Vlg.Root] at @s run function mhdp_core:phase/1_village/villager/tick

# 訓練所、今は仮の処理
# TODO:闘技場処理は切り分けて、IsTrainingプレイヤーの数に応じて以下の処理を実行
#   ・はじめてプレイヤーが入るとき、forceload開始
#   ・プレイヤーが居る場合、闘技場tick処理
#   ・プレイヤーが居なくなる場合、forceload解除
    # execute positioned -93 69 762 as @a[tag=Ply.State.IsTraining,distance=..2] run function mhdp_core:phase/1_village/training_area/exit/player
    execute if entity @a[tag=Ply.State.IsTraining] run function mhdp_core:phase/1_village/training_area/tick/main

# ベータ版処理
    execute as @a[tag=!Ply.State.PlayingQuest] run scoreboard players enable @s Ply.Ope.TutorialTrigger
    execute as @a if score @s Ply.Ope.TutorialTrigger matches 0.. run function mhdp_core:beta/phase/1_village/tutorial/review/show
    execute positioned -88 68 770 as @a[tag=Ply.State.IsTraining,dx=10,dy=20,dz=8] run function mhdp_core:phase/1_village/training_area/exit/player
