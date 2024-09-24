#> mhdp_core:player/death/in_advancement
#
# player死亡時処理 進捗達成時に実行
#
# @within function mhdp_core:player/advancement/hurt/entity_hurt_player

# 一部演出無効
    tag @s remove Ply.State.IsSilent

# ブロック中で死亡した場合、死亡アニメーションをスキップ
    execute unless block ~ ~ ~ #mhdp_core:no_collision run say ブロック中で死亡
    execute unless block ~ ~ ~ #mhdp_core:no_collision if data storage mhdp_core:game_data ActiveQuest{State:"Playing"} run function mhdp_core:phase/3_quest/call_from_player/death
    execute unless block ~ ~ ~ #mhdp_core:no_collision run function mhdp_core:phase/3_quest/call_from_player/move_to_camp
    execute unless block ~ ~ ~ #mhdp_core:no_collision run return 0

# クエスト中の場合，リスポーン地点を更新しつつ死亡演出開始
    execute if entity @s[tag=Ply.State.PlayingQuest] at @s align xyz positioned ~0.5 ~0.5 ~0.5 run function mhdp_core:player/death/in_advancement_setspawnpoint
    execute if entity @s[tag=Ply.State.PlayingQuest] run scoreboard players set @s Ply.Timer.DeathAnimation 0
    execute if entity @s[tag=Ply.State.PlayingQuest] run tag @s add Ply.Event.DeathAnimation
