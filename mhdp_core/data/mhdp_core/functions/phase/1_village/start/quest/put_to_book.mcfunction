#> mhdp_core:phase/1_village/start/quest/put_to_book
#
# 村Phase開始・更新処理 クエスト受注書の更新
#
# @within function mhdp_core:phase/1_village/start/main

# データの取り出し
    data modify storage mhdp_core:temp TargetQuest set from storage mhdp_core:temp TempQuestList[0]

# 必要なデータの取得
    data modify storage mhdp_core:temp TargetQuest.Field set from storage mhdp_core:temp TargetQuest.Content.Field

# 必要なデータ用ストレージを作成
    data modify storage mhdp_core:temp Data set value {}
    function mhdp_core:phase/1_village/start/quest/macro/m.create with storage mhdp_core:temp TargetQuest

# ページ追加
    function mhdp_core:phase/1_village/start/quest/macro/m.write with storage mhdp_core:temp Data

# 終了
    data remove storage mhdp_core:temp Data
    data remove storage mhdp_core:temp TargetQuest
    data remove storage mhdp_core:temp TempQuestList[0]

# データが残っている限り繰り返す
    execute if data storage mhdp_core:temp TempQuestList[0] run function mhdp_core:phase/1_village/start/quest/put_to_book
