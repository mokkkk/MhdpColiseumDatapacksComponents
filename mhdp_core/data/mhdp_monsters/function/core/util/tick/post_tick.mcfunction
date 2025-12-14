#> mhdp_monsters:core/util/tick/post_tick
# 
# 汎用処理 tick終了時処理
#
# @within function mhdp_monsters:/**

# ブロック内にいる場合
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision run function mhdp_monsters:core/util/tick/move/back_to_preposition

# 建築内にいる場合

# データ消去
    data remove storage mhdp_core:temp MonsterTemp
