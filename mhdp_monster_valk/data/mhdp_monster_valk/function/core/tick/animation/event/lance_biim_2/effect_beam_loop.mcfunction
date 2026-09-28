#> mhdp_monster_valk:core/tick/animation/event/lance_biim_2/effect_beam_loop
#
# アニメーションイベントハンドラ 龍閃 地割れ演出
#
# @within function mhdp_monster_valk:core/tick/animation/event/lance_biim_2/effect_beam

# ロード圏外の場合実行しない
    execute unless loaded ~ ~ ~ run return 0

# Object: GroundCrack (16)
    execute positioned ^ ^0.5 ^ rotated ~ 0 run function api:object/summon.m {ObjectId:16}

# 再帰
    scoreboard players remove #mhdp_temp_valk_beam_count MhdpCore 1
    execute if score #mhdp_temp_valk_beam_count MhdpCore matches 1.. if block ^ ^ ^3 #mhdp_core:no_collision positioned ^ ^ ^3 run function mhdp_monster_valk:core/tick/animation/event/lance_biim_2/effect_beam_loop
