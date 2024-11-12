#> mhdp_core:phase/3_quest/timer/m.set_timer
#
# クエスト中のtick処理
#
# @within function mhdp_core:phase/tick

# タイマー表示
    $execute if score #mhdp_quest_timer_current MhdpCore matches 10.. run scoreboard players display numberformat $mhdp_temp_quest_timer_value Quest.Timer.Text fixed {"text":"$(Min):$(Sec)","color":"green"}
    $execute if score #mhdp_quest_timer_current MhdpCore matches ..9 run scoreboard players display numberformat $mhdp_temp_quest_timer_value Quest.Timer.Text fixed {"text":"$(Min):0$(Sec)","color":"green"}
