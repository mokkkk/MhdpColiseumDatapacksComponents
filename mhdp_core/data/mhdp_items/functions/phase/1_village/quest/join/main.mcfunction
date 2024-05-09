#> mhdp_core:phase/1_village/quest/join/main
#
# クエスト参加処理
#
# @within function mhdp_core:phase/1_village/quest/join/click

# クエスト受注条件に満たない場合、実行しない
    execute unless data storage mhdp_core:game_data {Phase:1} run tellraw @s {"text":"【現在クエスト中です。終了までお待ちください】"}
    execute unless data storage mhdp_core:game_data {Phase:1} run return 0
    execute unless score #mhdp_core_loading_quest_id MhdpCore matches 0.. run tellraw @s {"text":"【クエストが受注されていません】"}
    execute unless score #mhdp_core_loading_quest_id MhdpCore matches 0.. run return 0

# ホストの場合、実行しない
    execute if entity @s[tag=Ply.State.QuestHost] run tellraw @s {"text":"【既にクエストを受注しています】"}
    execute if entity @s[tag=Ply.State.QuestHost] run return 0

# 既に参加済みの場合、キャンセル処理
    execute if entity @s[tag=Ply.State.QuestMember] run function mhdp_core:phase/1_village/quest/join/cancel

# 参加していない場合、参加処理
    execute if entity @s[tag=!Ply.State.QuestMember,tag=!Ply.Temp.TargetSub] run function mhdp_core:phase/1_village/quest/join/join

# 終了
    tag @s remove Ply.Temp.TargetSub
