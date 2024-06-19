#> mhdp_core:phase/2_village_to_quest/start/quest/enable_datapack
#
# クエストデータのロード モンスターのデータパック読み込み
#
# @within function mhdp_core:phase/2_village_to_quest/start/main

# データ取り出し
    data modify storage mhdp_core:temp Temp.MonsterUid set from storage mhdp_core:temp Monsters[0].MonsterId

# 分岐処理
    function mhdp_monsters:core/switch/enable_datapack

# データが残っている場合、繰り返す
    data remove storage mhdp_core:temp Monsters[0]
    execute if data storage mhdp_core:temp Monsters[0] run function mhdp_core:phase/2_village_to_quest/start/quest/enable_datapack
