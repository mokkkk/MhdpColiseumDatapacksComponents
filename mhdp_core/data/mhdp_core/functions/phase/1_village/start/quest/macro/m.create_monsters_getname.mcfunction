#> mhdp_core:phase/1_village/start/quest/macro/m.create_monsters_getname
#
# 村Phase開始・更新処理 クエスト受注書の更新 出現モンスター一覧の作成処理
#
# @within function mhdp_core:phase/1_village/start/quest/macro/m.create

# 名前をリストに追加
    $data modify storage mhdp_core:temp Data.Monster$(Index) set from storage mhdp_core:game_data QuestBookData.Monsters[{ID:$(MonsterId)}].ShowName
