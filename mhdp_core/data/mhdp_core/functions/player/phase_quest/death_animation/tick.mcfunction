#> mhdp_core:player/phase_quest/death_animation/tick
#
# 死亡演出
#
# @within function mhdp_core:player/phase_quest/tick

# タイマー増加
    scoreboard players add @s Ply.Timer.DeathAnimation 1

# 開始
    execute if score @s Ply.Timer.DeathAnimation matches 1 run function mhdp_core:player/phase_quest/death_animation/start
    execute if score @s Ply.Timer.DeathAnimation matches 1..10 at @s align xyz run tp @s ~0.5 ~ ~0.5

# クエスト中の終了処理
    execute if score @s Ply.Timer.DeathAnimation matches 100.. if data storage mhdp_core:game_data ActiveQuest{State:"Playing"} run function mhdp_core:player/phase_quest/death_animation/end_on_quest

# 終了
    # execute if score @s Ply.Timer.DeathAnimation matches 100.. run tag @s remove Ply.Event.DeathAnimation
