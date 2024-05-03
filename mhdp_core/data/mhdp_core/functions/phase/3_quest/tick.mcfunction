#> mhdp_core:phase/3_quest/tick
#
# クエスト中のtick処理
#
# @within function mhdp_core:phase/tick

# マップ個別処理
    # 大闘技場
        execute if data storage mhdp_core:game_data ActiveQuest{Field:"Coliseum"} run function mhdp_core:phase/3_quest/map/coliseum/main

# フェーズ移行処理
    # クエスト成功時
        execute if data storage mhdp_core:game_data ActiveQuest{State:"Succeed"} run function mhdp_core:phase/3_quest/change_phase/succeed/wait
    # クエスト失敗時
        execute if data storage mhdp_core:game_data ActiveQuest{State:"Failed"} run function mhdp_core:phase/3_quest/change_phase/failed/wait
    # クエストリタイア時
