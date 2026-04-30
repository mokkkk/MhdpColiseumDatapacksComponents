#> mhdp_core:phase/3_quest/map/general/click_retire
#
# クエスト中のtick処理
#
# @within function mhdp_core:phase/tick

# ベルを鳴らす
    function assets:core/field/ring_bell.m with storage mhdp_core:game_data ActiveQuest

# クエスト中のみ実行
    execute unless data storage mhdp_core:game_data ActiveQuest{State:"Playing"} run return 0

# 状態更新
    execute as @a[tag=Ply.Temp.Target] if entity @s[tag=!Ply.State.IsRetire] run return run function mhdp_core:phase/3_quest/map/general/start_retire
    execute as @a[tag=Ply.Temp.Target] if entity @s[tag=Ply.State.IsRetire] run return run function mhdp_core:phase/3_quest/map/general/cancel_retire
