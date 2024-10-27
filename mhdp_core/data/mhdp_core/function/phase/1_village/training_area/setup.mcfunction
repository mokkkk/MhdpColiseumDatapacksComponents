#> mhdp_core:phase/1_village/training_area/setup
#
# 訓練所のセットアップ
#
# @within function 

# からくり飛竜設置
    execute as @e[type=item_display,tag=Mns.Root.Karakuri] at @s run function mhdp_monsters:core/switch/remove
    execute positioned 162 58 -10 rotated 90 0 run function mhdp_monster_karakuri:core/summon/summon
