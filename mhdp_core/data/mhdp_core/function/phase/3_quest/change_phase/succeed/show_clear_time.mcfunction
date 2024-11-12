#> mhdp_core:phase/3_quest/change_phase/succeed/show_clear_time
#
# 次Phaseへ遷移 クエスト成功時の待機処理
#
# @within function mhdp_core:phase/3_quest/tick

# クリアタイム表示
    execute store result score #mhdp_quest_timer_clear_tick MhdpCore store result score #mhdp_quest_timer_clear_min MhdpCore run scoreboard players operation #mhdp_quest_timer_clear MhdpCore /= #const_20 Const
    scoreboard players operation #mhdp_quest_timer_clear_min MhdpCore /= #const_60 Const
    scoreboard players operation #mhdp_quest_timer_clear MhdpCore %= #const_60 Const
    execute if score #mhdp_quest_timer_clear MhdpCore matches 10.. run tellraw @a[tag=Ply.State.PlayingQuest] [{"text": "クリアタイム："},{"score":{"name":"#mhdp_quest_timer_clear_min","objective":"MhdpCore"}},{"text": ":"},{"score":{"name":"#mhdp_quest_timer_clear","objective":"MhdpCore"}}]
    execute if score #mhdp_quest_timer_clear MhdpCore matches ..9 run tellraw @a[tag=Ply.State.PlayingQuest] [{"text": "クリアタイム："},{"score":{"name":"#mhdp_quest_timer_clear_min","objective":"MhdpCore"}},{"text": ":0"},{"score":{"name":"#mhdp_quest_timer_clear","objective":"MhdpCore"}}]

# Beta版処理
    execute if data storage mhdp_core:game_data {IsBetaVersion:true} run function mhdp_core:beta/phase/3_quest/record_clear_time

# 終了
    scoreboard players reset #mhdp_quest_timer_clear_tick MhdpCore
    scoreboard players reset #mhdp_quest_timer_clear_min MhdpCore
    scoreboard players reset #mhdp_quest_timer_clear MhdpCore
