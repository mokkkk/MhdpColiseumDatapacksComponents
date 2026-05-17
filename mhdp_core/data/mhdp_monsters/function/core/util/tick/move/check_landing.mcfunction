#> mhdp_monsters:core/util/tick/move/check_landing
# 
# 汎用処理 接地確認

# 空中
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/tick/move/adjust_height

# ブロック内
    # 共通処理の post_tick で処理されるため、移動不要
