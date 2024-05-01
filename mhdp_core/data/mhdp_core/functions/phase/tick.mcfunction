#> mhdp_core:phase/tick
#
# 各Phaseへの処理振り分け
#
# @within mhdp_core:tick

# Phase取得
    # execute if data storage mhdp_core:game_data {Phase:1} run say 村
    # execute if data storage mhdp_core:game_data {Phase:2} run say 村→クエスト
    # execute if data storage mhdp_core:game_data {Phase:3} run say クエスト
    # execute if data storage mhdp_core:game_data {Phase:4} run say クエスト→村
