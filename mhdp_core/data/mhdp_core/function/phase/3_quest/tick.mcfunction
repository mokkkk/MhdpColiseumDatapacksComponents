#> mhdp_core:phase/3_quest/tick
#
# クエスト中のtick処理
#
# @within function mhdp_core:phase/tick

# クエスト参加者の存在確認
    execute if data storage mhdp_core:game_data ActiveQuest{State:"Playing"} unless entity @a[tag=Ply.State.PlayingQuest] run function mhdp_core:phase/3_quest/end/retired_no_player

# 制限時間処理
    execute if data storage mhdp_core:game_data ActiveQuest{State:"Playing"} if data storage mhdp_core:game_data ActiveQuest{IsCountDown:true} run scoreboard players add #mhdp_quest_timer_clear MhdpCore 1
    execute if score #mhdp_quest_timer MhdpCore matches 0.. if data storage mhdp_core:game_data ActiveQuest{State:"Playing"} if data storage mhdp_core:game_data ActiveQuest{IsCountDown:true} run scoreboard players remove #mhdp_quest_timer MhdpCore 1
    execute if score #mhdp_quest_timer MhdpCore matches 6001 run tellraw @a[tag=Ply.State.PlayingQuest] {"text": "【制限時間残り5分です】"}
    execute if score #mhdp_quest_timer MhdpCore matches 1201 run tellraw @a[tag=Ply.State.PlayingQuest] {"text": "【制限時間残り1分です】"}
    execute if score #mhdp_quest_timer MhdpCore matches 0.. run function mhdp_core:phase/3_quest/timer/main
    execute if score #mhdp_quest_timer MhdpCore matches 0 run tellraw @a[tag=Ply.State.PlayingQuest] {"text": "【制限時間切れです】"}
    execute if score #mhdp_quest_timer MhdpCore matches 0 run function mhdp_core:phase/3_quest/end/failed

# マップ個別処理(tick)
    # 大闘技場
        execute if data storage mhdp_core:game_data ActiveQuest{Field:"Coliseum"} run function mhdp_core:phase/3_quest/map/coliseum/main

# フェーズ移行処理
    # クエスト成功時
        execute if data storage mhdp_core:game_data ActiveQuest{State:"Succeed"} run function mhdp_core:phase/3_quest/change_phase/succeed/wait
    # クエスト失敗時
        execute if data storage mhdp_core:game_data ActiveQuest{State:"Failed"} run function mhdp_core:phase/3_quest/change_phase/failed/wait
    # クエストリタイア時
        execute if data storage mhdp_core:game_data ActiveQuest{State:"Retired"} run function mhdp_core:phase/3_quest/change_phase/retired/wait
