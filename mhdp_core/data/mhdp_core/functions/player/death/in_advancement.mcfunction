#> mhdp_core:player/death/in_advancement
#
# player死亡時処理 進捗達成時に実行
#
# @within function mhdp_core:player/advancement/hurt/entity_hurt_player

# クエスト中の場合，リスポーン地点を更新しつつ死亡演出開始
    execute if entity @s[tag=Ply.State.PlayingQuest] at @s align xyz positioned ~0.5 ~0.5 ~0.5 run function mhdp_core:player/death/in_advancement_setspawnpoint
    execute if entity @s[tag=Ply.State.PlayingQuest] run scoreboard players set @s Ply.Timer.DeathAnimation 0
    execute if entity @s[tag=Ply.State.PlayingQuest] run tag @s add Ply.Event.DeathAnimation
