#> mhdp_core:core/init/quests_monsterdata
#
# クエストデータ作成用処理 表示用のモンスターデータを登録する
#
# @within
#     function mhdp_core:core/init/quests
#     function mhdp_core:core/init/quests_monsterdata

# 取り出し
    data modify storage mhdp_core:temp TargetMonsterData set from storage mhdp_core:temp MonsterData[-1]
    data remove storage mhdp_core:temp MonsterData[-1]

# 処理実行
    function mhdp_core:core/init/macro/m.quests_monsterdata with storage mhdp_core:temp TargetMonsterData

# データが残っている限り繰り返す
    execute if data storage mhdp_core:temp MonsterData[0] run function mhdp_core:core/init/quests_monsterdata

say mhdp_core:core/init/quests_monsterdata