#> mhdp_core:phase/1_village/start/main
#
# 村Phase開始・更新処理
#
# @within function mhdp_core:phase/3_quest/change_phase/general/main

# 処理に必要なEntityの有無を確認
    function mhdp_core:phase/1_village/start/entity/main

# TODO: ストーリーの確認・進行
    # ベータ版
        execute if data storage mhdp_core:game_data {IsBetaVersion:true} run function mhdp_core:beta/phase/1_village/start

# クエストの更新
    function mhdp_core:phase/1_village/start/quest/main
