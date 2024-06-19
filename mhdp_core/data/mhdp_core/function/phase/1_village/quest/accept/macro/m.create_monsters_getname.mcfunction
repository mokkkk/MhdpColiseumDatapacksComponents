#> mhdp_core:phase/1_village/quest/accept/macro/m.create_monsters_getname
#
# クエスト受注処理 受注内容の表示
#
# @within function mhdp_core:phase/1_village/quest/accept/macro/m.create_monsters

# 名前をリストに追加
    $data modify storage mhdp_core:temp Data.Monster$(Index) set from storage mhdp_core:game_data QuestBookData.Monsters[{ID:$(MonsterId)}].ShowName
