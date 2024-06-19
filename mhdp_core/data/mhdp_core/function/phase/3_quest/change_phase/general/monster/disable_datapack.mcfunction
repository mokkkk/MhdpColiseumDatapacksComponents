#> mhdp_core:phase/3_quest/change_phase/general/monster/disable_datapack
#
# モンスターのリセット処理 データパック解放
#
# @within function mhdp_core:phase/3_quest/change_phase/general/main

# データ取り出し
    data modify storage mhdp_core:temp Temp.MonsterUid set from storage mhdp_core:game_data ActiveQuest.Monsters[0].MonsterId

# 分岐処理
    function mhdp_monsters:core/switch/disable_datapack

# データが残っている場合、繰り返す
    data remove storage mhdp_core:game_data ActiveQuest.Monsters[0]
    execute if data storage mhdp_core:game_data ActiveQuest.Monsters[0] run function mhdp_core:phase/3_quest/change_phase/general/monster/disable_datapack
