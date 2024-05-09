#> mhdp_core:phase/1_village/quest/accept/macro/m.create_notifydata
#
# クエスト受注処理 受注内容の表示
#
# @within function mhdp_core:phase/1_village/quest/accept/notify

# クエスト名
    data modify storage mhdp_core:temp Data.Name set from storage mhdp_core:temp TargetQuest.Name

# 難易度
    $data modify storage mhdp_core:temp Data.Level set from storage mhdp_core:game_data QuestBookData.Level[$(Level)]

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
    function mhdp_core:phase/1_village/quest/accept/macro/m.create_monsters

# 制限時間
    data modify storage mhdp_core:temp Data.TimeLimit set from storage mhdp_core:temp TargetQuest.Content.TimeLimit

# 失敗条件
    data modify storage mhdp_core:temp Data.DeathCount set from storage mhdp_core:temp TargetQuest.Content.DeathCount
