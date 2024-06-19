#> mhdp_core:core/init/macro/m.quests_monsterdata
#
# クエストデータ作成用処理 表示用のモンスターデータを登録する
#
# @within function mhdp_core:core/init/quests_monsterdata

# データを追加
    $data modify storage mhdp_core:game_data QuestBookData.Monsters append value {ID:$(Uid),ShowName:{"text":"\\$(Icon)","color":"white","font":"icons/mhdp_icons","hoverEvent":{"action":"show_text","value":[{"text":"$(JpName)"}]}}}
