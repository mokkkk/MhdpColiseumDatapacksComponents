#> mhdp_core:player/phase_quest/tick
#
# player別に毎tick実行される処理 クエスト中のみ
#
# @within function mhdp_core:player/tick

# 連番IDの一致確認
    execute unless score @s Ply.Other.QuestSerialId = #mhdp_core_quest_serial_id QuestSerialId run function mhdp_core:player/phase_quest/cancel_quest/main

# 死亡演出
    execute if entity @s[tag=Ply.Event.DeathAnimation] run function mhdp_core:player/phase_quest/death_animation/tick
