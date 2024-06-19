#> mhdp_core:phase/1_village/quest/join/cancel
#
# クエスト参加処理 キャンセル
#
# @within function mhdp_core:phase/1_village/quest/join/main

# 通知
    tellraw @a[tag=Ply.State.QuestMember] [{"text": "【"},{"selector":"@s"},{"text": "がクエストへの参加を解除しました】"}]

# 離脱
    tag @s remove Ply.State.QuestMember
    team leave @s

# 多重参加防止
    tag @s add Ply.Temp.TargetSub
