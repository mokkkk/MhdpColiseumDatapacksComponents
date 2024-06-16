#> mhdp_core:phase/1_village/change_phase/check_quest
#
# 次Phaseへ遷移できるか確認する
#
# @within function mhdp_core:phase/1_village/bell/check

# クエストが受注されていない場合、エラー
    execute unless score #mhdp_core_loading_quest_id MhdpCore matches 0.. run data modify storage mhdp_core:temp Errors.IsNotQuestOrdered set value true
    execute if data storage mhdp_core:temp Errors{IsNotQuestOrdered:true} run data modify storage mhdp_core:temp IsError set value true

# クエストが存在しない場合、エラー
    execute store result storage mhdp_core:temp Temp.ActiveQuestId int 1 run scoreboard players get #mhdp_core_loading_quest_id MhdpCore
    execute if data storage mhdp_core:temp {IsError:false} run function mhdp_core:phase/1_village/change_phase/macro/m.check_quest_exist with storage mhdp_core:temp Temp
    data remove storage mhdp_core:temp Temp
    execute if data storage mhdp_core:temp Errors{IsQuestNotExist:true} run data modify storage mhdp_core:temp IsError set value true
