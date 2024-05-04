#> mhdp_core:phase/1_village/start/quest/macro/m.create
#
# 村Phase開始・更新処理 クエスト受注書の更新
#
# @within function mhdp_core:phase/1_village/start/main

# ID
    data modify storage mhdp_core:temp Data.ID set from storage mhdp_core:temp TargetQuest.ID

# クエスト名
    data modify storage mhdp_core:temp Data.Name set from storage mhdp_core:temp TargetQuest.Name

# 難易度
    $data modify storage mhdp_core:temp Data.Level set from storage mhdp_core:game_data QuestBookData.Level[$(Level)]

# クリア状態
    data modify storage mhdp_core:temp Data.State set value ""
    execute if data storage mhdp_core:temp TargetQuest.State{IsPlayed:false} run data modify storage mhdp_core:temp Data.State set value "(NEW)"
    execute if data storage mhdp_core:temp TargetQuest.State{IsCleared:true} run data modify storage mhdp_core:temp Data.State set value "(CLEAR)"
    data modify storage mhdp_core:temp Data.Color set value "blue"
    execute if data storage mhdp_core:temp TargetQuest.State{IsHardCleared:true} run data modify storage mhdp_core:temp Data.State set value "(CLEAR)"
    execute if data storage mhdp_core:temp TargetQuest.State{IsHardCleared:true} run data modify storage mhdp_core:temp Data.Color set value "red"

# 報酬金
    data modify storage mhdp_core:temp Data.Reward set from storage mhdp_core:temp TargetQuest.Content.RewardMoney

# フィールド
    $data modify storage mhdp_core:temp Data.Field set from storage mhdp_core:game_data QuestBookData.Field[{ID:$(Field)}].Name

# モンスターリスト
    data modify storage mhdp_core:temp Data.MonsterList set from storage mhdp_core:temp TargetQuest.Content.Monsters
    data modify storage mhdp_core:temp Data.Monster1 set value {"text":""}
    data modify storage mhdp_core:temp Data.Monster2 set value {"text":""}
    data modify storage mhdp_core:temp Data.Monster3 set value {"text":""}
    data modify storage mhdp_core:temp Data.Monster4 set value {"text":""}
    data modify storage mhdp_core:temp Data.Monster5 set value {"text":""}
    scoreboard players set #mhdp_temp_grobal MhdpCore 0
    function mhdp_core:phase/1_village/start/quest/macro/m.create_monsters

# 制限時間
    data modify storage mhdp_core:temp Data.TimeLimit set from storage mhdp_core:temp TargetQuest.Content.TimeLimit

# 失敗条件
    data modify storage mhdp_core:temp Data.DeathCount set from storage mhdp_core:temp TargetQuest.Content.DeathCount
