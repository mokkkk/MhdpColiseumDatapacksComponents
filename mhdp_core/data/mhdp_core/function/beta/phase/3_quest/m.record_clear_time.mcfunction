#> mhdp_core:beta/phase/3_quest/m.record_clear_time
#
# クエスト終了時の処理
#
# @within function mhdp_core:phase/2_village_to_quest/change_phase/setup/player/main

# クリアタイムが更新できない場合、リセット
    $execute store result score #mhdp_temp_clear_time MhdpCore run data get storage mhdp_core:game_data QuestList[{ID:$(ID)}].ClearTime
    execute unless score #mhdp_temp_clear_time MhdpCore matches 1.. run scoreboard players set #mhdp_temp_clear_time MhdpCore 99999999
    $execute if score #mhdp_temp_clear_time MhdpCore matches ..$(Tick) run return run scoreboard players reset #mhdp_temp_clear_time MhdpCore

# クリアタイムを記録
    $setblock $(X) $(Y) $(Z) air
    $execute if score #mhdp_quest_timer_clear MhdpCore matches 10.. run setblock $(X) $(Y) $(Z) oak_wall_sign[facing=south]{back_text:{messages:['"$(Tick)"','{"text":""}','{"text":""}','{"text":""}']},front_text:{has_glowing_text:1b,messages:['{"text":"$(Name1)","color":"black"}','{"text":"$(Name2)","color":"black"}','{"text":"$(Min):$(Sec)","color":"black"}','{"text":""}']},is_waxed:1b} replace
    $execute unless score #mhdp_quest_timer_clear MhdpCore matches 10.. run setblock $(X) $(Y) $(Z) oak_wall_sign[facing=south]{back_text:{messages:['"$(Tick)"','{"text":""}','{"text":""}','{"text":""}']},front_text:{has_glowing_text:1b,messages:['{"text":"$(Name1)","color":"black"}','{"text":"$(Name2)","color":"black"}','{"text":"$(Min):0$(Sec)","color":"black"}','{"text":""}']},is_waxed:1b} replace
    $data modify storage mhdp_core:game_data QuestList[{ID:$(ID)}].ClearTime set value $(Tick)

# 終了
    scoreboard players reset #mhdp_temp_clear_time MhdpCore
