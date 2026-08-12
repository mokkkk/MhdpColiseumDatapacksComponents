#> mhdp_core:player/trigger/reset
#
# トリガーの初期化

# 初期値設定
    scoreboard players set @s Ply.Ope.AcceptedQuestId -1
    scoreboard players set @s Ply.Ope.TutorialTrigger -1
    scoreboard players set @s Ply.Ope.HunterNote.General -1
    scoreboard players set @s Ply.Ope.HunterNote.ShowMenu -1
    scoreboard players set @s Ply.Ope.HunterNote.Options -1

# 有効化
    scoreboard players enable @s Ply.Ope.AcceptedQuestId
    scoreboard players enable @s Ply.Ope.TutorialTrigger
    scoreboard players enable @s Ply.Ope.HunterNote.General
    scoreboard players enable @s Ply.Ope.HunterNote.ShowMenu
    scoreboard players enable @s Ply.Ope.HunterNote.Options
