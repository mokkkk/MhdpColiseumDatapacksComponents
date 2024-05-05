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

# 状態更新
    tag @s add Ply.State.QuestHost
    tag @s add Ply.State.QuestMember
    team join Team.QuestHost @s

# 通知
    function mhdp_core:phase/1_village/quest/accept/notify
