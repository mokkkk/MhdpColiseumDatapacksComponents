#> mhdp_core:beta/phase/3_quest/record_clear_time
#
# クエスト終了時の処理
#
# @within function mhdp_core:phase/2_village_to_quest/change_phase/setup/player/main

# 対象のクエスト以外はスキップ
    execute if score #mhdp_core_loading_quest_id MhdpCore matches ..9 run return 0
    execute if score #mhdp_core_loading_quest_id MhdpCore matches 18.. run return 0

# クエストIDに応じて位置を決定
    execute if score #mhdp_core_loading_quest_id MhdpCore matches 10 run data modify storage mhdp_core:temp SignTemp set value {ID:10,X:249,Y:65,Z:199,Name1:"",Name2:"青鳥竜の狩猟"}
    execute if score #mhdp_core_loading_quest_id MhdpCore matches 14 run data modify storage mhdp_core:temp SignTemp set value {ID:14,X:249,Y:64,Z:199,Name1:"【高難度】",Name2:"青鳥竜の狩猟"}
    execute if score #mhdp_core_loading_quest_id MhdpCore matches 11 run data modify storage mhdp_core:temp SignTemp set value {ID:11,X:250,Y:65,Z:199,Name1:"",Name2:"火竜の狩猟"}
    execute if score #mhdp_core_loading_quest_id MhdpCore matches 15 run data modify storage mhdp_core:temp SignTemp set value {ID:15,X:250,Y:64,Z:199,Name1:"【高難度】",Name2:"火竜の狩猟"}
    execute if score #mhdp_core_loading_quest_id MhdpCore matches 12 run data modify storage mhdp_core:temp SignTemp set value {ID:12,X:251,Y:65,Z:199,Name1:"",Name2:"斬竜の狩猟"}
    execute if score #mhdp_core_loading_quest_id MhdpCore matches 16 run data modify storage mhdp_core:temp SignTemp set value {ID:16,X:251,Y:64,Z:199,Name1:"【高難度】",Name2:"斬竜の狩猟"}
    execute if score #mhdp_core_loading_quest_id MhdpCore matches 13 run data modify storage mhdp_core:temp SignTemp set value {ID:13,X:252,Y:65,Z:199,Name1:"",Name2:"天彗龍の狩猟"}
    execute if score #mhdp_core_loading_quest_id MhdpCore matches 17 run data modify storage mhdp_core:temp SignTemp set value {ID:17,X:252,Y:64,Z:199,Name1:"【高難度】",Name2:"天彗龍の狩猟"}

# クリアタイムを記録
    execute store result storage mhdp_core:temp SignTemp.Tick int 1 run scoreboard players get #mhdp_quest_timer_clear_tick MhdpCore
    execute store result storage mhdp_core:temp SignTemp.Min int 1 run scoreboard players get #mhdp_quest_timer_clear_min MhdpCore
    execute store result storage mhdp_core:temp SignTemp.Sec int 1 run scoreboard players get #mhdp_quest_timer_clear MhdpCore
    function mhdp_core:beta/phase/3_quest/m.record_clear_time with storage mhdp_core:temp SignTemp
    data remove storage mhdp_core:temp SignTemp
