#> mhdp_core:phase/1_village/quest/accept/macro/m.create_monsters
#
# クエスト受注処理 受注内容の表示
#
# @within
#       function mhdp_core:phase/1_village/quest/accept/macro/m.create_notifydata
#       function mhdp_core:phase/1_village/quest/accept/macro/m.create_monsters

# データ非表示の場合、[?]のみを表示する
    execute if data storage mhdp_core:temp TargetQuest{HideMonsters:true} run data modify storage mhdp_core:temp Data.Monster1 set value {"text":"\\uE000","color":white,"font":"icons/mhdp_icons","hoverEvent":{"action":"show_text","value":[{"text":"???"}]}}
    execute if data storage mhdp_core:temp TargetQuest{HideMonsters:true} run return 0

# データの取り出し
    data modify storage mhdp_core:temp TempMonsterData set from storage mhdp_core:temp Data.MonsterList[0]
    execute store result storage mhdp_core:temp TempMonsterData.Index int 1 run scoreboard players add #mhdp_temp_grobal MhdpCore 1

# 表示内容の特定
    function mhdp_core:phase/1_village/quest/accept/macro/m.create_monsters_getname with storage mhdp_core:temp TempMonsterData

# データが残っている限り繰り返す
    data remove storage mhdp_core:temp Data.MonsterList[0]
    data remove storage mhdp_core:temp TempMonsterData
    execute if data storage mhdp_core:temp Data.MonsterList[0] run function mhdp_core:phase/1_village/quest/accept/macro/m.create_monsters
