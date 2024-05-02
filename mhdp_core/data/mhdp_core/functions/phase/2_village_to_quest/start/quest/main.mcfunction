#> mhdp_core:phase/2_village_to_quest/start/quest/main
#
# クエストデータのロード
#
# @within function mhdp_core:phase/2_village_to_quest/start/main

# TODO: 以下デバッグ用のため削除
    say クエストデータロード
    data modify storage mhdp_core:game_data ActiveQuest set value {Field:"Coliseum"}

# 使用するマップのforceload
    # 大闘技場
        execute if data storage mhdp_core:game_data ActiveQuest{Field:"Coliseum"} run function mhdp_core:phase/2_village_to_quest/change_phase/setup/map/coliseum_forceload
