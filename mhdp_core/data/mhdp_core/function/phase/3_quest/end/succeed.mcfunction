#> mhdp_core:phase/3_quest/end/succeed
#
# 次Phaseへ遷移 クエスト成功
#
# @within function 

# クエスト成功時処理開始
    scoreboard players set #mhdp_core_timer MhdpCore 0
    data modify storage mhdp_core:game_data ActiveQuest.State set value "Succeed"
