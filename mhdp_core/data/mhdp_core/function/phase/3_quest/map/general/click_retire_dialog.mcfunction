#> mhdp_core:phase/3_quest/map/general/click_retire_dialog
#
# クエスト中のtick処理
#
# @within function mhdp_core:phase/tick

# クエスト中のみ実行
    execute unless data storage mhdp_core:game_data ActiveQuest{State:"Playing"} run return 0

# 状態更新
    execute if entity @s[tag=!Ply.State.IsRetire] run return run function mhdp_core:phase/3_quest/map/general/start_retire
    execute if entity @s[tag=Ply.State.IsRetire] run return run function mhdp_core:phase/3_quest/map/general/cancel_retire
