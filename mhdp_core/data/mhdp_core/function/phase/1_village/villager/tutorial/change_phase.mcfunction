#> mhdp_monster_tutorial_01:core/tick/change_phase
#
# tick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# タイマー初期化
    scoreboard players set @s Vlg.General.Timer 0

# カウンター増加
    scoreboard players add @s Vlg.General.Counter 1
