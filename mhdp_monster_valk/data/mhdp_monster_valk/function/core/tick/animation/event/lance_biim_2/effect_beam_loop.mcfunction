#> mhdp_monster_valk:core/tick/animation/event/lance_biim_2/effect_beam_loop
#
# アニメーションイベントハンドラ 龍閃
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# ロード圏外の場合実行しない
    execute unless loaded ~ ~ ~ run return 0

# 演出
    execute facing entity @e[type=marker,tag=Mk.Field.Back,sort=random,limit=1] feet rotated ~ 0 positioned ^ ^-2 ^ run function mhdp_monsters:core/effect/crack_ground/start

# 再帰
    scoreboard players remove #mhdp_temp_valk_beam_count MhdpCore 1
    execute if score #mhdp_temp_valk_beam_count MhdpCore matches 1.. if block ^ ^ ^3 #mhdp_core:no_collision positioned ^ ^ ^3 run function mhdp_monster_valk:core/tick/animation/event/lance_biim_2/effect_beam_loop
