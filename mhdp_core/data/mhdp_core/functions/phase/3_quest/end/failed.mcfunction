#> mhdp_core:phase/3_quest/end/failed
#
# 次Phaseへ遷移 クエスト失敗
#
# @within function 

# クエスト失敗時処理開始
    scoreboard players set #mhdp_core_timer MhdpCore 0
    data modify storage mhdp_core:game_data ActiveQuest.State set value "Failed"
