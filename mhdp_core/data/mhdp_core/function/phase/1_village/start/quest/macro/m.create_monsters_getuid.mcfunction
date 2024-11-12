#> mhdp_core:phase/1_village/start/quest/macro/m.create_monsters_getname
#
# 村Phase開始・更新処理 クエスト受注書の更新 出現モンスター一覧の作成処理
#
# @within function mhdp_core:phase/1_village/start/quest/macro/m.create

# Uidを返す
    $return run data get storage mhdp_core:game_data QuestBookData.Monsters[{ID:$(MonsterId)}].Uid
