#> mhdp_core:phase/3_quest/map/general/click_retire
#
# クエスト中のtick処理
#
# @within function mhdp_core:phase/tick

# ベルを鳴らす
    # 大闘技場
        execute if data storage mhdp_core:game_data ActiveQuest{Field:"Coliseum"} run function mhdp_core:phase/3_quest/map/coliseum/ring_bell

# クエスト中のみ実行
    execute unless data storage mhdp_core:game_data ActiveQuest{State:"Playing"} run return 0

# 状態更新
    execute as @a[tag=Ply.Temp.Target] if entity @s[tag=!Ply.State.IsRetire] run return run function mhdp_core:phase/3_quest/map/general/start_retire
    execute as @a[tag=Ply.Temp.Target] if entity @s[tag=Ply.State.IsRetire] run return run function mhdp_core:phase/3_quest/map/general/cancel_retire
