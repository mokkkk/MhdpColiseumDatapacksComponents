#> mhdp_monster_valk:core/tick/animation/event/lance_biim_2/attack_beam_finish_loop
#
# アニメーションイベントハンドラ 龍閃 ビーム振り下ろし
#
# @within function mhdp_monster_valk:core/tick/animation/event/lance_biim_2/attack_beam_finish

# ロード圏外の場合実行しない
    execute unless loaded ~ ~ ~ run return 0

# 演出
    particle dust{color:[1.000,0.000,0.152],scale:3} ^ ^1 ^ 0.8 0.8 0.8 0.15 13
    particle explosion ^ ^ ^ 1.8 1.8 1.8 0 6
    particle dust_pillar{block_state:"minecraft:sand"} ^ ^-1 ^ 2 0.1 2 0.3 10 force

    # Object: RedFlash (10047)
        data modify storage api: Arg.Override set value {Scale:8}
        function api:object/summon.m {ObjectId:10047}

# 再帰
    scoreboard players remove #mhdp_temp_valk_beam_count MhdpCore 1
    execute if score #mhdp_temp_valk_beam_count MhdpCore matches 1.. if block ^ ^ ^5 #mhdp_core:no_collision positioned ^ ^ ^5 run function mhdp_monster_valk:core/tick/animation/event/lance_biim_2/attack_beam_finish_loop
