#> api:debug/clear_quest.m
#
# デバッグ用処理、特定IDのクエストをクリアし、村の状態を更新する
#
# @input storage api: Arg.Id クエストID

# クエストデータにクリア済みを設定
    $data modify storage mhdp_core:temp Temp.ActiveQuestId set value $(Id)
    function mhdp_core:phase/3_quest/change_phase/succeed/macro/m.update_data with storage mhdp_core:temp Temp
    data remove storage mhdp_core:temp Temp

# 村状態更新
    function mhdp_core:phase/1_village/start/main

# 終了
    data remove storage api: Arg
