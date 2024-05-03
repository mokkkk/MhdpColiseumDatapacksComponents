#> mhdp_core:phase/tick
#
# 各Phaseへの処理振り分け
#
# @within mhdp_core:tick

# 村
    # execute if data storage mhdp_core:game_data {Phase:1}

# 村→クエスト
    execute if data storage mhdp_core:game_data {Phase:2} run function mhdp_core:phase/2_village_to_quest/tick

# クエスト
    execute if data storage mhdp_core:game_data {Phase:3} run function mhdp_core:phase/3_quest/tick

# クエスト→村
