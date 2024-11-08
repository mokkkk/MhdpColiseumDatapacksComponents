#> mhdp_core:phase/3_quest/map/general/start_retire
#
# クエスト中のtick処理
#
# @within function mhdp_core:phase/tick

# 自身のリタイアタグ更新
    tag @s add Ply.State.IsRetire



# プレイヤー数を調べる
    execute store result score #mhdp_temp_player_count MhdpCore if entity @a[tag=Ply.State.PlayingQuest]
    execute store result score #mhdp_temp_player_count_retired MhdpCore if entity @a[tag=Ply.State.PlayingQuest,tag=Ply.State.IsRetire]
    scoreboard players operation #mhdp_temp_player_count MhdpCore /= #mhdp_temp_player_count_retired MhdpCore

# 過半数を超えるプレイヤーがリタイアした場合、クエストリタイア開始
    execute if score #mhdp_temp_player_count MhdpCore matches ..1 run function mhdp_core:phase/3_quest/end/retired

# それ以外の場合、通知
    execute if score #mhdp_temp_player_count MhdpCore matches 2.. at @s run tellraw @a[tag=Ply.State.PlayingQuest,distance=1..] [{"text":"【"},{"selector":"@s"},{"text":" がクエストリタイアに投票しました】"}]
    execute if score #mhdp_temp_player_count MhdpCore matches 2.. run tellraw @s [{"text":"【クエストリタイアに投票しました】"}]
    execute if score #mhdp_temp_player_count MhdpCore matches 2.. run tellraw @s [{"text":"【過半数のプレイヤーがリタイアした場合、クエストを中断します】"}]

# 終了
    scoreboard players reset #mhdp_temp_player_count MhdpCore
    scoreboard players reset #mhdp_temp_player_count_retired MhdpCore
