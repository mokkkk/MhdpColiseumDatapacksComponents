#> mhdp_monster_valk:core/tick/animation/event/lance_biim_2/attack_beam_loop
#
# アニメーションイベントハンドラ 龍閃
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# ロード圏外の場合実行しない
    execute unless loaded ~ ~ ~ run return 0

# ヒット確認
    # 対プレイヤー
        execute positioned ^ ^1 ^ as @a[tag=Ply.State.EnableDamage,distance=..4.5] run tag @s add Temp.Hit
        execute as @a[tag=Temp.Hit] run function mhdp_core:player/damage/entity_to_player/main
        tag @a remove Temp.Hit

# 演出
    # particle dust{color:[1.000,0.000,0.152],scale:3} ^ ^1 ^ 0.8 0.8 0.8 0.15 13
    execute if predicate {"condition":"minecraft:random_chance","chance":0.5} run particle explosion ^ ^ ^ 1.8 0.3 1.8 0 1 force
    # particle block{block_state:"minecraft:sand"} ^ ^ ^ 2 0.1 2 0 15 force
    particle dust_pillar{block_state:"minecraft:sand"} ^ ^-1 ^ 2 0.1 2 0.3 6 force

# 再帰
    scoreboard players remove #mhdp_temp_valk_beam_count MhdpCore 1
    execute if score #mhdp_temp_valk_beam_count MhdpCore matches 1.. if block ^ ^ ^3 #mhdp_core:no_collision positioned ^ ^ ^3 run function mhdp_monster_valk:core/tick/animation/event/lance_biim_2/attack_beam_loop
