#> mhdp_core:phase/1_village/villager/weapon_tutorial/change_phase
#
# 武器チュートリアル
#
# @within function mhdp_core:tick

# タイマー初期化
    scoreboard players set @s Vlg.General.Timer 0

# カウンター増加
    scoreboard players add @s Vlg.General.Counter 1
