#> mhdp_core:phase/1_village/start/quest/macro/m.create_monsters
#
# 村Phase開始・更新処理 クエスト受注書の更新 出現モンスター一覧の作成処理
#
# @within function mhdp_core:phase/1_village/start/quest/macro/m.create

# データの取り出し
    data modify storage mhdp_core:temp TempMonsterData set from storage mhdp_core:temp Data.MonsterList[0]
    execute store result storage mhdp_core:temp TempMonsterData.Index int 1 run scoreboard players add #mhdp_temp_grobal MhdpCore 1

# 表示内容の特定
    function mhdp_core:phase/1_village/start/quest/macro/m.create_monsters_getname with storage mhdp_core:temp TempMonsterData

# データが残っている限り繰り返す
    data remove storage mhdp_core:temp Data.MonsterList[0]
    data remove storage mhdp_core:temp TempMonsterData
    execute if data storage mhdp_core:temp Data.MonsterList[0] run function mhdp_core:phase/1_village/start/quest/macro/m.create_monsters
