#> mhdp_core:phase/3_quest/change_phase/succeed/change
#
# 次Phaseへ遷移 クエスト成功時の帰還処理
#
# @within function mhdp_core:phase/3_quest/change_phase/succeed/wait

# 報酬取得

# クエストデータにクリア済みを設定
    execute store result storage mhdp_core:temp Temp.ActiveQuestId int 1 run scoreboard players get #mhdp_core_loading_quest_id MhdpCore
    function mhdp_core:phase/3_quest/change_phase/succeed/macro/m.update_data with storage mhdp_core:temp Temp
    data remove storage mhdp_core:temp Temp

# 共通処理
    function mhdp_core:phase/3_quest/change_phase/general/main
