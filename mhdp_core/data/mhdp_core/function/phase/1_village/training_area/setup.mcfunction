#> mhdp_core:phase/1_village/training_area/setup
#
# 訓練所のセットアップ
#
# @within function 

# からくり飛竜設置
    execute as @e[type=item_display,tag=Mns.Root.Karakuri] at @s run function mhdp_monsters:core/switch/remove
    execute positioned -102 69 811 rotated 180 0 run function mhdp_monster_karakuri:core/summon/summon
    effect give @e[type=slime,tag=Mns.HitBox.Karakuri] instant_health infinite 0 true
