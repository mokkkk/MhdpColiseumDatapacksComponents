#> mhdp_core:phase/3_quest/end/retired_no_player
#
# 次Phaseへ遷移 クエストリタイア
#
# @within function 

# クエストリタイア時処理開始
    scoreboard players set #mhdp_core_timer MhdpCore 0
    data modify storage mhdp_core:game_data ActiveQuest.State set value "Retired"

# 通知
    tellraw @a {"text":"【クエスト参加者が居なくなったため、クエストを中断します】","color": "red"}
    say Quest Retire : No Player