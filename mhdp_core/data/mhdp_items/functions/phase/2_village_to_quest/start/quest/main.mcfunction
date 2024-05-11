#> mhdp_core:phase/2_village_to_quest/start/quest/main
#
# クエストデータのロード
#
# @within function mhdp_core:phase/2_village_to_quest/start/main

# クエストデータのロード
    data remove storage mhdp_core:game_data ActiveQuest
    execute store result storage mhdp_core:temp Temp.ActiveQuestId int 1 run scoreboard players get #mhdp_core_loading_quest_id MhdpCore
    function mhdp_core:phase/2_village_to_quest/start/quest/macro/m.load_data with storage mhdp_core:temp Temp
    data remove storage mhdp_core:temp Temp

# TODO: クエストデータの適用
    # 制限時間
        execute store result score #mhdp_quest_timer_max MhdpCore store result score #mhdp_quest_timer MhdpCore run data get storage mhdp_core:game_data ActiveQuest.TimeLimit
    # 乙回数
        execute store result score #mhdp_quest_deathcount_max MhdpCore run data get storage mhdp_core:game_data ActiveQuest.DeathCount
        # スキル
            # 報酬金保険
                execute if entity @a[tag=Ply.State.QuestMember,tag=Skill.Food.Insurance] run scoreboard players add #mhdp_quest_deathcount_max MhdpCore 1
        execute store result score #mhdp_quest_deathcount MhdpCore run scoreboard players get #mhdp_quest_deathcount_max MhdpCore

# 使用するマップのforceload
    # 大闘技場
        execute if data storage mhdp_core:game_data ActiveQuest{Field:"Coliseum"} run function mhdp_core:phase/2_village_to_quest/change_phase/setup/map/coliseum_forceload
