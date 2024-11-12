#> mhdp_core:phase/3_quest/timer/main
#
# クエスト中のtick処理
#
# @within function mhdp_core:phase/tick

# タイマー計算
    scoreboard players operation #mhdp_quest_timer_current MhdpCore = #mhdp_quest_timer MhdpCore
    execute store result score #mhdp_quest_timer_current_tick MhdpCore store result score #mhdp_quest_timer_current_min MhdpCore run scoreboard players operation #mhdp_quest_timer_current MhdpCore /= #const_20 Const
    execute store result storage mhdp_core:temp Temp.Timer.Min int 1 run scoreboard players operation #mhdp_quest_timer_current_min MhdpCore /= #const_60 Const
    execute store result storage mhdp_core:temp Temp.Timer.Sec int 1 run scoreboard players operation #mhdp_quest_timer_current MhdpCore %= #const_60 Const

# タイマー表示
    function mhdp_core:phase/3_quest/timer/m.set_timer with storage mhdp_core:temp Temp.Timer

# 終了
    scoreboard players reset #mhdp_quest_timer_current_tick MhdpCore
    scoreboard players reset #mhdp_quest_timer_current_min MhdpCore
    scoreboard players reset #mhdp_quest_timer_current MhdpCore
