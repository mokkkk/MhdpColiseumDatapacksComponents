#> mhdp_core:phase/1_village/change_phase/show_error
#
# 次Phaseへ遷移できるか確認する
#
# @within function mhdp_core:phase/1_village/change_phase/check

# 共通表示
    execute unless entity @a[tag=Ply.State.QuestMember] run tellraw @a[tag=Ply.Temp.Target] {"text":"【ERROR!:クエスト出発条件を満たしていません。以下をご確認ください。】","color": "red"}
    execute if entity @a[tag=Ply.State.QuestMember] run tellraw @a[tag=Ply.Temp.Target] {"text":"【ERROR!:クエスト出発条件を満たしていません。以下をご確認ください。】","color": "red"}

# エラー内容に応じた表示
    # クエスト未受注、QuestMemberがいないためクリック者にのみ表示
        execute if data storage mhdp_core:temp Errors{IsNotQuestOrdered:true} run tellraw @a[tag=Ply.Temp.Target] {"text":" - 【クエストが受注されていません】","color": "red"}
    # クエスト存在チェック
        execute if data storage mhdp_core:temp Errors{IsQuestNotExist:true} run tellraw @a[tag=Ply.State.QuestMember] {"text":" - 【対象のクエストは存在しません】","color": "red"}
