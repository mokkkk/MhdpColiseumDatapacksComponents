#> mhdp_monsters:core/super/tick/post_tick
# 
# 共通処理 tick終了時

# 埋まり防止処理

# ブロック内にいる場合
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision run function mhdp_monsters:core/util/tick/move/adjust_position

# 建築内にいる場合

# モンスター用の一時storageを消去
    data remove storage mhdp_core:temp MonsterTemp
