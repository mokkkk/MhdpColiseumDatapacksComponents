#> mhdp_core:phase/1_village/quest/cancel/only
#
# クエストキャンセル処理
#
# @within
#       function mhdp_core:phase/1_village/quest/click_accept

# 通知
    execute as @a[tag=Ply.State.QuestHost,tag=!Ply.Temp.Target] run tellraw @s {"text":"【受注していたクエストがキャンセルされました】"}
    execute as @a[tag=Ply.State.QuestMember,tag=!Ply.State.QuestHost] run tellraw @s {"text":"【参加していたクエストがキャンセルされました】"}
    execute as @a[tag=Ply.State.QuestMember] at @s run playsound ui.button.click master @s ~ ~ ~ 1 1

# チームから除去
    team leave @a[team=Team.QuestHost]
    team leave @a[team=Team.QuestMember]

# タグ消去
    tag @a remove Ply.State.QuestHost
    tag @a remove Ply.State.QuestMember

# クエストIDを設定
    scoreboard players set #mhdp_core_loading_quest_id MhdpCore -1
    scoreboard players set @s Ply.Ope.AcceptedQuestId -1

# クエスト受注書更新
    function mhdp_core:phase/1_village/start/quest/main
