#> mhdp_monster_valk:core/tick/animation/event/lance_biim_2/attack_beam_air_loop
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

# 再帰
    scoreboard players remove #mhdp_temp_valk_beam_count MhdpCore 1
    execute if score #mhdp_temp_valk_beam_count MhdpCore matches 1.. if block ^ ^ ^3 #mhdp_core:no_collision positioned ^ ^ ^3 run function mhdp_monster_valk:core/tick/animation/event/lance_biim_2/attack_beam_air_loop
