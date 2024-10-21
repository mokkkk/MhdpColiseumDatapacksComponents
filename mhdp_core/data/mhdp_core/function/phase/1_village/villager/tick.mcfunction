#> mhdp_core:phase/1_village/villager/tick
#
# 村のtick処理
#
# @within function mhdp_core:tick

# チュートリアル(体験版)
    execute if entity @s[tag=Vlg.VillageTutorial] run function mhdp_core:phase/1_village/villager/tutorial/main
