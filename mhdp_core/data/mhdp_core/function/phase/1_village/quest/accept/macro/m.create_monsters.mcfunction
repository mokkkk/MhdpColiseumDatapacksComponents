#> mhdp_core:phase/1_village/quest/accept/macro/m.create_monsters
#
# クエスト受注処理 受注内容の表示
#
# @within
#       function mhdp_core:phase/1_village/quest/accept/macro/m.create_notifydata
#       function mhdp_core:phase/1_village/quest/accept/macro/m.create_monsters

# データ非表示の場合、[?]のみを表示する
    execute if data storage mhdp_core:temp TargetQuest{HideMonsters:true} run data modify storage mhdp_core:temp Data.Monster1 set value {"text":"\uE000","color":white,"font":"icons/mhdp_icons","hover_event":{"action":"show_text","value":[{"text":"???"}]}}
    execute if data storage mhdp_core:temp TargetQuest{HideMonsters:true} run return 0

# データの取り出し
    data modify storage mhdp_core:temp TempMonsterData set from storage mhdp_core:temp Data.MonsterList[0]
    # UID取得、UID9000以上はチュートリアルのため表示しない
        execute store result score #mhdp_temp_monsterdata_uid MhdpCore run data get storage mhdp_core:temp TempMonsterData.MonsterId
    execute unless score #mhdp_temp_monsterdata_uid MhdpCore matches 9000.. store result storage mhdp_core:temp TempMonsterData.Index int 1 run scoreboard players add #mhdp_temp_grobal MhdpCore 1

# 表示内容の特定
    execute unless score #mhdp_temp_monsterdata_uid MhdpCore matches 9000.. run function mhdp_core:phase/1_village/quest/accept/macro/m.create_monsters_getname with storage mhdp_core:temp TempMonsterData

# データが残っている限り繰り返す
    scoreboard players reset #mhdp_temp_monsterdata_uid MhdpCore
    data remove storage mhdp_core:temp Data.MonsterList[0]
    data remove storage mhdp_core:temp TempMonsterData
    execute if data storage mhdp_core:temp Data.MonsterList[0] run function mhdp_core:phase/1_village/quest/accept/macro/m.create_monsters
