#> mhdp_core:player/phase_village/cancel_quest
#
# player別に毎tick実行される処理 クエスト中のみ
#
# @within function mhdp_core:player/tick

# 通知
    tellraw @s {"text":"【受注していたクエストがキャンセルされました】"}
    playsound ui.button.click master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1

# チームから除去
    team leave @s[team=Team.QuestHost]
    team leave @s[team=Team.QuestMember]

# タグ消去
    tag @a remove Ply.State.QuestHost
    tag @a remove Ply.State.QuestMember

