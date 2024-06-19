#> mhdp_core:player/phase_quest/tick
#
# player別に毎tick実行される処理 クエスト中のみ
#
# @within function mhdp_core:player/tick

# 死亡演出
    execute if entity @s[tag=Ply.Event.DeathAnimation] run function mhdp_core:player/phase_quest/death_animation/tick
