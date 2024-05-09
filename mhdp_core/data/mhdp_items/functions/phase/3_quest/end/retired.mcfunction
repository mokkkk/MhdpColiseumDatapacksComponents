#> mhdp_core:phase/3_quest/end/retired
#
# 次Phaseへ遷移 クエストリタイア
#
# @within function 

# クエストリタイア時処理開始
    scoreboard players set #mhdp_core_timer MhdpCore 0
    data modify storage mhdp_core:game_data ActiveQuest.State set value "Retired"
