#> mhdp_core:phase/1_village/quest/join/join
#
# クエスト参加処理
#
# @within function mhdp_core:phase/1_village/quest/join/main

# 通知
    playsound ui.button.click master @s ~ ~ ~ 1 1

# クエストに参加
    tag @s add Ply.State.QuestMember
    team join Team.QuestMember @s

# 通知
    tellraw @a[tag=Ply.State.QuestMember] [{"text": "【"},{"selector":"@s"},{"text": "がクエストに参加しました】"}]
