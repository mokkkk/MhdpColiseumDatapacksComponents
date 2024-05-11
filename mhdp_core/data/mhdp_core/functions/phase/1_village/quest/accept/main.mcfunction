#> mhdp_core:phase/1_village/quest/accept/main
#
# クエスト受注処理
#
# @within function mhdp_core:phase/1_village/quest/click_accept

# 既に受注されているクエストがある場合、キャンセル
    tag @s add Ply.Temp.Target
    execute if entity @a[tag=Ply.State.QuestHost] run function mhdp_core:phase/1_village/quest/cancel/main
    tag @s remove Ply.Temp.Target

# クエストIDを設定
    scoreboard players operation #mhdp_core_loading_quest_id MhdpCore = @s Ply.Ope.AcceptedQuestId
    scoreboard players operation #mhdp_core_pre_played_quest_id MhdpCore = #mhdp_core_loading_quest_id MhdpCore

# 状態更新
    tag @s add Ply.State.QuestHost
    tag @s add Ply.State.QuestMember
    team join Team.QuestHost @s

# クエスト受注書更新
    function mhdp_core:phase/1_village/start/quest/main

# 通知
    function mhdp_core:phase/1_village/quest/accept/notify
