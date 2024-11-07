#> mhdp_core:phase/1_village/quest/join/main
#
# クエスト参加処理
#
# @within function mhdp_core:phase/1_village/quest/join/click

# クエスト受注条件に満たない場合、実行しない
    # クエスト中
        execute unless data storage mhdp_core:game_data {Phase:1} run return run tellraw @s {"text":"【現在クエスト中です。終了までお待ちください】","color": "red"}
    # クエスト未受注
        execute unless score #mhdp_core_loading_quest_id MhdpCore matches 0.. run return run tellraw @s {"text":"【クエストが受注されていません】","color": "red"}
    # 訓練中は利用不可
        execute as @a[tag=Ply.Temp.Target] if entity @s[tag=Ply.State.IsTraining] run return run tellraw @s {"text": "【訓練中は利用できません】","color": "red"}
    # クエストホストの場合
        execute if entity @s[tag=Ply.State.QuestHost] run return run tellraw @s {"text":"【既にクエストを受注しています】","color": "red"}

# 既に参加済みの場合、キャンセル処理
    execute if entity @s[tag=Ply.State.QuestMember] run function mhdp_core:phase/1_village/quest/join/cancel

# 参加していない場合、参加処理
    execute if entity @s[tag=!Ply.State.QuestMember,tag=!Ply.Temp.TargetSub] run function mhdp_core:phase/1_village/quest/join/join

# 終了
    tag @s remove Ply.Temp.TargetSub
