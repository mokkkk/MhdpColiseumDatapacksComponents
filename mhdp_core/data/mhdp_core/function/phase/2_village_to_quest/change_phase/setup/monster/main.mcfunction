#> mhdp_core:phase/2_village_to_quest/change_phase/setup/monster/main
#
# クエスト開始処理
#
# @within
#     function mhdp_core:phase/2_village_to_quest/change_phase/setup/main
#     function mhdp_core:phase/2_village_to_quest/change_phase/setup/monster/main

# 位置決定
    summon marker ~ ~ ~ {Tags:["Mk.Field.SummonPos"]}
    execute positioned as @e[type=marker,tag=Mk.Field.Center] run spreadplayers ~ ~ 10 20 false @e[type=marker,tag=Mk.Field.SummonPos]

# モンスターIDを取得
    data modify storage mhdp_core:temp Arg.MonsterUid set from storage mhdp_core:game_data ActiveQuest.TargetMonsters[0].MonsterId
    data modify storage mhdp_core:temp Arg.Timing set from storage mhdp_core:game_data ActiveQuest.TargetMonsters[0].Timing
    data remove storage mhdp_core:game_data ActiveQuest.TargetMonsters[0]

# 出現条件が最初からの場合、配置処理
    execute store result storage mhdp_core:temp Temp.Rotate int 1 run random value 0..359
    execute if data storage mhdp_core:temp Arg{Timing:"Initial"} positioned as @e[type=marker,tag=Mk.Field.SummonPos,sort=random,limit=1] run function mhdp_monsters:core/switch/summon with storage mhdp_core:temp Temp
    data modify storage mhdp_core:temp MonsterQuestData set from storage mhdp_core:temp Arg
    data remove storage mhdp_core:temp Arg

# 位置リセット
    kill @e[type=marker,tag=Mk.Field.SummonPos]

# データが残っている場合、繰り返す
    execute if data storage mhdp_core:game_data ActiveQuest.TargetMonsters[0] run function mhdp_core:phase/2_village_to_quest/change_phase/setup/monster/main
