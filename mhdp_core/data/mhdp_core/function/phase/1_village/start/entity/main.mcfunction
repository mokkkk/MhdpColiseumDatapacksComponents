#> mhdp_core:phase/1_village/start/entity/main
#
# 村Phase開始・更新処理 処理に必要なEntityの有無を確認
#
# @within function mhdp_core:phase/1_village/start/main

# 処理用のEntity配置
    # クエスト出発口
        function mhdp_core:phase/1_village/start/entity/macro/m.start_bell with storage mhdp_core:game_data PositionList[{ID:"StartBell"}]
    # クエストボード
        execute rotated 0 0 run function mhdp_core:phase/1_village/start/entity/macro/m.quest_board with storage mhdp_core:game_data PositionList[{ID:"QuestBoard"}]

# クエスト受注書
    # 下位・コハク
        function mhdp_core:phase/1_village/start/entity/macro/m.lectern with storage mhdp_core:game_data PositionList[{ID:"QuestBookKohaku"}]

# チェスト
    # 落とし物
        function mhdp_core:phase/1_village/start/entity/macro/m.lost_item_chest with storage mhdp_core:game_data PositionList[{ID:"LostItemChest"}]
